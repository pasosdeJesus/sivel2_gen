# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Controllers
      module ValidarcasosController
        extend ActiveSupport::Concern

        included do
          def validacion_estandar(casos, titulo, where,
            atr = [:id, :fecha, :nusuario],
            encabezado = [
              "Código", "Fecha del Hecho", "Usuario",
            ],
            ordenapor = "fecha")
            res = casos.joins('INNER JOIN public.sivel2_gen_iniciador
                              ON sivel2_gen_iniciador.caso_id=sivel2_gen_caso.id')
              .where(where).order(ordenapor).select(atr)
            arr = ActiveRecord::Base.connection.select_all(res.to_sql)
            @validaciones << {
              titulo: titulo,
              encabezado: encabezado,
              cuerpo: arr,
            }
          end

          def filtro_fechas(casos, cfecha = "sivel2_gen_caso.fecha")
            pfid = ""
            if params[:validarcaso] && params[:validarcaso][:fechaini]
              if params[:validarcaso][:fechaini] != ""
                pfi = params[:validarcaso][:fechaini]
                pfid = pfi
              else
                pfid = nil
              end
            else
              # Comenzar en semestre anterior
              pfid = Msip::FormatoFechaHelper.inicio_semestre(Date.today).to_s
            end
            if pfid
              casos = casos.where("#{cfecha} >= ?", pfid)
            end
            if params[:validarcaso] && params[:validarcaso][:fechafin] &&
                params[:validarcaso][:fechafin] != ""
              pff = params[:validarcaso][:fechafin]
              pffd = pff
              if pffd
                casos = casos.where("#{cfecha} <= ?", pffd)
              end
            end
            casos
          end

          def filtro_etiqueta(casos)
            if params[:validarcaso] && params[:validarcaso][:etiqueta_id] &&
                params[:validarcaso][:etiqueta_id] != "" &&
                Msip::Etiqueta.where(
                  id: params[:validarcaso][:etiqueta_id].to_i,
                ).count > 0

              casos = casos.where(
                'sivel2_gen_caso.id IN (SELECT caso_id FROM
                                  sivel2_gen_caso_etiqueta
                                  WHERE etiqueta_id=?)',
                params[:validarcaso][:etiqueta_id].to_i,
              )
            end
            casos
          end

          def ini_filtro
            casos = Sivel2Gen::Caso.all.order(:fecha)
            puts "OJO 1 casos.count=·#{casos.count}"
            casos = filtro_fechas(casos)
            puts "OJO 2 casos.count=·#{casos.count}"
            casos = filtro_etiqueta(casos)
            puts "OJO 3 casos.count=·#{casos.count}"
            casos
          end

          def valida_sin_memo(cini, cmemo = "memo")
            validacion_estandar(
              cini,
              "Casos sin memo",
              "TRIM(#{cmemo})='' OR #{cmemo} IS NULL",
            )
          end

          def valida_fecha_otra_fuente(c)
            c = c.joins('INNER JOIN public.sivel2_gen_caso_fotra
                  ON sivel2_gen_caso_fotra.caso_id=sivel2_gen_caso.id')
            validacion_estandar(
              c,
              "Casos con fecha de otra fuente anterior a la del caso",
              "sivel2_gen_caso_fotra.fecha < sivel2_gen_caso.fecha",
            )
          end

          def valida_fecha_fuente_frecuente(c)
            c = c.joins('INNER JOIN public.sivel2_gen_caso_fuenteprensa
                  ON sivel2_gen_caso_fuenteprensa.caso_id=sivel2_gen_caso.id')
            validacion_estandar(
              c,
              "Casos con fecha de fuente frecuente anterior a la del caso",
              "sivel2_gen_caso_fuenteprensa.fecha < sivel2_gen_caso.fecha",
            )
          end

          def valida_fecha_analista_antes(c)
            c = c.joins('INNER JOIN (SELECT c.id, min(cu.fechainicio)
              FROM sivel2_gen_caso_usuario AS cu, sivel2_gen_caso AS c
              WHERE c.id=cu.caso_id GROUP BY c.id ORDER BY c.id) AS mf
              ON sivel2_gen_caso.id=mf.id')
            validacion_estandar(
              c,
              "Casos con fecha de analista anterior a la del caso",
              "mf.min < sivel2_gen_caso.fecha",
            )
          end

          def valida_casos_sin_analista(c)
            res = c.where('NOT EXISTS (SELECT caso_id
              FROM sivel2_gen_caso_usuario
              WHERE caso_id=sivel2_gen_caso.id)')
              .order("sivel2_gen_caso.fecha").select([:id, :fecha])
            arr = ActiveRecord::Base.connection.select_all(res.to_sql)
            @validaciones << {
              titulo: "Casos sin analista",
              encabezado: ["Código", "Fecha del Hecho"],
              cuerpo: arr,
            }
          end

          def valida_sin_ubicacion_principal(c)
            validacion_estandar(
              c,
              "Casos sin ubicación principal",
              "ubicacion_id IS NULL",
            )
          end

          def valida_categorias_individuales(c)
            c = c.joins('INNER JOIN sivel2_gen_acto
              ON sivel2_gen_acto.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN sivel2_gen_categoria
              ON sivel2_gen_categoria.id=sivel2_gen_acto.categoria_id')
            validacion_estandar(
              c,
              "Casos con acto individual con categoria colectiva",
              "sivel2_gen_categoria.tipocat <> 'I'",
            )
          end

          def valida_categorias_colectivas(c)
            c = c.joins('INNER JOIN sivel2_gen_actocolectivo
              ON sivel2_gen_actocolectivo.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN sivel2_gen_categoria
              ON sivel2_gen_categoria.id=sivel2_gen_actocolectivo.categoria_id')
            validacion_estandar(
              c,
              "Casos con acto colectivo con categoria individual",
              "sivel2_gen_categoria.tipocat <> 'C'",
            )
          end

          def valida_victima_individual_sin_acto(c)
            c = c.joins('INNER JOIN sivel2_gen_victima
              ON sivel2_gen_victima.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN msip_persona
              ON sivel2_gen_victima.persona_id=msip_persona.id')
            validacion_estandar(
              c,
              "Víctima individual sin acto",
              'NOT EXISTS (SELECT persona_id FROM sivel2_gen_acto
              WHERE persona_id=msip_persona.id)',
            )
          end

          def valida_victima_colectiva_sin_acto(c)
            c = c.joins('INNER JOIN sivel2_gen_victimacolectiva
              ON sivel2_gen_victimacolectiva.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN msip_grupoper
              ON sivel2_gen_victimacolectiva.grupoper_id=msip_grupoper.id')
            validacion_estandar(
              c,
              "Víctima colectiva sin acto",
              'NOT EXISTS (SELECT grupoper_id FROM sivel2_gen_actocolectivo
              WHERE grupoper_id=msip_grupoper.id)',
            )
          end

          def valida_nombres_victimas_cortos(c)
            c = c.joins('INNER JOIN sivel2_gen_victima
              ON sivel2_gen_victima.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN msip_persona
              ON sivel2_gen_victima.persona_id=msip_persona.id')
            validacion_estandar(
              c,
              "Nombres de víctimas individuales muy cortos",
              'length(msip_persona.nombres) <= 2
              AND msip_persona.nombres <> \'N\'',
            )
          end

          def valida_apellidos_victimas_cortos(c)
            c = c.joins('INNER JOIN sivel2_gen_victima
              ON sivel2_gen_victima.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN msip_persona
              ON sivel2_gen_victima.persona_id=msip_persona.id')
            validacion_estandar(
              c,
              "Apellidos de víctimas individuales muy cortos",
              'length(msip_persona.apellidos) <= 2
              AND msip_persona.apellidos <> \'N\'',
            )
          end

          def valida_nombres_victimas_colectivas_cortos(c)
            c = c.joins('INNER JOIN sivel2_gen_victimacolectiva
              ON sivel2_gen_victimacolectiva.caso_id=sivel2_gen_caso.id')
              .joins('INNER JOIN msip_grupoper
              ON sivel2_gen_victimacolectiva.grupoper_id=msip_grupoper.id')
            validacion_estandar(
              c,
              "Nombres de víctimas colectivas muy cortos",
              "LENGTH(msip_grupoper.nombre) <= 2",
            )
          end

          def validar_sivel2_gen
            c = ini_filtro
            valida_sin_memo(c)
            valida_fecha_otra_fuente(c)
            valida_fecha_fuente_frecuente(c)
            valida_fecha_analista_antes(c)
            valida_casos_sin_analista(c)
            valida_sin_ubicacion_principal(c)
            valida_categorias_individuales(c)
            valida_categorias_colectivas(c)
            valida_victima_individual_sin_acto(c)
            valida_victima_colectiva_sin_acto(c)
            valida_nombres_victimas_cortos(c)
            valida_apellidos_victimas_cortos(c)
            valida_nombres_victimas_colectivas_cortos(c)
          end

          def crear_vista_iniciador
            ActiveRecord::Base.connection.execute("
       CREATE OR REPLACE VIEW public.sivel2_gen_iniciador AS (
         SELECT s3.caso_id, s3.fechainicio, s3.usuario_id, usuario.nusuario
         FROM public.usuario, (SELECT s2.caso_id,
            s2.fechainicio,
            min(s2.usuario_id) AS usuario_id
           FROM public.sivel2_gen_caso_usuario s2,
            ( SELECT f1.caso_id,
                    min(f1.fechainicio) AS m
                   FROM public.sivel2_gen_caso_usuario f1
                  GROUP BY f1.caso_id) c
          WHERE s2.caso_id = c.caso_id
            AND s2.fechainicio = c.m
          GROUP BY s2.caso_id,
            s2.fechainicio
          ORDER BY s2.caso_id,
            s2.fechainicio
          ) s3
          WHERE usuario.id=s3.usuario_id); ")
          end

          def validar_interno
            crear_vista_iniciador
            validar_sivel2_gen
          end

          def validar
            authorize!(:contar, Sivel2Gen::Caso)
            @rango_fechas = "Fecha del hecho"
            @titulo_validarcasos = "Reporte de validación de casos"
            @validaciones = []

            validar_interno

            respond_to do |format|
              format.html do
                render(
                  "sivel2_gen/validarcasos/validar",
                  layout: "application",
                )
              end
              format.json { head(:no_content) }
              format.js   { head(:no_content) }
            end
          end # def validar

          def validarcasos_params
            params.require(:validarcaso).permit(
              :fechafin,
              :fechaini,
              :etiqueta,
            )
          end
        end
      end
    end
  end
end
