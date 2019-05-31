# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Controllers
      module ValidarcasosController
        extend ActiveSupport::Concern

        included do

          def validacion_estandar(casos, titulo, where, 
                                  atr = [:id, :fecha, :nusuario],
                                  encabezado = [
                                    'Código', 'Fecha del Hecho', 'Usuario'],
                                 ordenapor = 'fecha')
            res = casos.joins('INNER JOIN public.sivel2_gen_iniciador 
                              ON sivel2_gen_iniciador.id_caso=sivel2_gen_caso.id').
                              where(where).order(ordenapor).select(atr)
            arr = ActiveRecord::Base.connection.select_all(res.to_sql)
            @validaciones << { 
              titulo: titulo,
              encabezado: encabezado,
              cuerpo: arr 
            }
          end

          def filtro_fechas(casos, cfecha = 'fecha')
            if (params[:validarcaso] && params[:validarcaso][:fechaini] && 
                params[:validarcaso][:fechaini] != '')
              pfi = params[:validarcaso][:fechaini]
              if Rails.application.config.x.formato_fecha == 'dd-mm-yyyy'
                pfid = Date.strptime(pfi, '%d-%m-%Y')
              else
                pfid = Date.strptime(pfi, '%Y-%m-%d')
              end
              casos = casos.where("#{cfecha} >= ?", pfid.strftime('%Y-%m-%d'))
            end
            if(params[:validarcaso] && params[:validarcaso][:fechafin] && 
               params[:validarcaso][:fechafin] != '')
              pff = params[:validarcaso][:fechafin]
              if Rails.application.config.x.formato_fecha == 'dd-mm-yyyy'
                pffd = Date.strptime(pff, '%d-%m-%Y')
              else
                pffd = Date.strptime(pff, '%Y-%m-%d')
              end
              casos = casos.where("#{cfecha} <= ?", pffd.strftime('%Y-%m-%d'))
            end
           return casos 
          end

          def ini_filtro
            casos = Sivel2Gen::Caso.all.order(:fecha)
            casos = filtro_fechas(casos)
            return casos
          end

          def valida_sinmemo(cini, cmemo = 'memo')
            validacion_estandar(cini, 'Casos sin memo', 
                                "TRIM(#{cmemo})='' OR #{cmemo} IS NULL")
          end

          def valida_fechaotrafuente(c)
            c = c.joins('INNER JOIN public.sivel2_gen_caso_fotra
                  ON sivel2_gen_caso_fotra.id_caso=sivel2_gen_caso.id')
            validacion_estandar(
              c, 'Casos con fecha de otra fuente anterior a la del caso', 
              'sivel2_gen_caso_fotra.fecha < sivel2_gen_caso.fecha'
            )
          end

          def valida_fechafuentefrecuente(c)
            c = c.joins('INNER JOIN public.sivel2_gen_caso_fuenteprensa
                  ON sivel2_gen_caso_fuenteprensa.id_caso=sivel2_gen_caso.id')
            validacion_estandar(
              c, 'Casos con fecha de fuente frecuente anterior a la del caso', 
              'sivel2_gen_caso_fuenteprensa.fecha < sivel2_gen_caso.fecha'
            )
          end

          def valida_fechausuarioantes(c)
            c = c.joins('INNER JOIN (SELECT c.id, min(cu.fechainicio) 
              FROM sivel2_gen_caso_usuario AS cu, sivel2_gen_caso AS c 
              WHERE c.id=cu.id_caso GROUP BY c.id ORDER BY c.id) AS mf
              ON sivel2_gen_caso.id=mf.id')
            validacion_estandar(
              c, 'Casos con fecha de analista anterior a la del caso', 
              'mf.min < sivel2_gen_caso.fecha'
            )
          end

          def valida_casosinanalista(c)
            res = c.where('NOT EXISTS (SELECT id_caso 
              FROM sivel2_gen_caso_usuario 
              WHERE id_caso=sivel2_gen_caso.id)').
              order('sivel2_gen_caso.fecha').select([:id, :fecha])
            arr = ActiveRecord::Base.connection.select_all(res.to_sql)
            @validaciones << { 
              titulo: 'Casos sin analista',
              encabezado: ['Código', 'Fecha del Hecho'],
              cuerpo: arr 
            }
          end

          def valida_sinubicacionprincipal(c)
            validacion_estandar(
              c, 'Casos sin ubicación principal', 
              'ubicacion_id IS NULL'
            )

          end

          def valida_categoriasindividuales(c)
            c = c.joins('INNER JOIN sivel2_gen_acto 
              ON sivel2_gen_acto.id_caso=sivel2_gen_caso.id').
              c.joins('INNER JOIN sivel2_gen_categoria
              ON sivel2_gen_categoria.id_caso=sivel2_gen_acto.categoria_id')
            validacion_estandar(
              c, 'Casos con acto individual con categoria colectiva', 
              'sivel2_gen_categoria.tipocat <> \'I\''
            )

          end


          def validar_sivel2_gen
            c = ini_filtro
            valida_sinmemo(c)
            valida_fechaotrafuente(c)
            valida_fechafuentefrecuente(c)
            valida_fechausuarioantes(c)
            valida_casosinanalista(c)
            valida_sinubicacionprincipal(c)
          end

          def crear_vista_iniciador
            ActiveRecord::Base.connection.execute("
       CREATE OR REPLACE VIEW public.sivel2_gen_iniciador AS (
         SELECT s3.id_caso, s3.fechainicio, s3.id_usuario, usuario.nusuario 
         FROM public.usuario, (SELECT s2.id_caso,
            s2.fechainicio,
            min(s2.id_usuario) AS id_usuario
           FROM public.sivel2_gen_caso_usuario s2,
            ( SELECT f1.id_caso,
                    min(f1.fechainicio) AS m
                   FROM public.sivel2_gen_caso_usuario f1
                  GROUP BY f1.id_caso) c
          WHERE s2.id_caso = c.id_caso 
            AND s2.fechainicio = c.m
          GROUP BY s2.id_caso, 
            s2.fechainicio
          ORDER BY s2.id_caso, 
            s2.fechainicio
          ) s3 
          WHERE usuario.id=s3.id_usuario); ");
          end

          def validar_interno
            crear_vista_iniciador
            validar_sivel2_gen
          end

          def validar
            authorize! :contar, Sivel2Gen::Caso
            @rango_fechas = 'Fecha del hecho'
            @titulo_validarcasos = 'Reporte de Validaciones'
            @validaciones = []

            validar_interno

            respond_to do |format|
              format.html { 
                render 'sivel2_gen/validarcasos/validar', 
                layout: 'application' 
              }
              format.json { head :no_content }
              format.js   { head :no_content }
            end
          end # def validar
          
          def validarcasos_params
            params.require(:validarcaso).permit(
              :fechafin,
              :fechaini
            )
          end

        end

      end
    end
  end
end

