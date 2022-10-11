require 'sivel2_gen/concerns/controllers/graficar_conteo_controller'

module Sivel2Gen
  module Concerns
    module Controllers
      module GraficarVictimizacionesIndividualesController
        extend ActiveSupport::Concern

        included do

          include Sivel2Gen::Concerns::Controllers::GraficarConteoController

          def plantillahtml
            'victimizaciones_individuales'
          end

          def cons1
            'cvt1'
          end

          def cons2
            ''
          end

          # Arma varios filtros de selección múltiple genéricos
          def arma_estfiltrosm_gen
            f = {
              'CATEGORIAS' => {
                nomfiltro: nil,
                coleccion: nil,
                metodo_etiqueta: nil,
                metodo_id: nil,
                campocons: 'categoria.id'
              },
              'FECHAS' => {
                nomfiltro: nil,
                coleccion: nil,
                metodo_etiqueta: nil,
                metodo_id: nil,
                campocons: 'tiempo_dia'
              },
              'DEPARTAMENTOS' => { 
                nomfiltro: :departamentos,
                coleccion: Sip::Departamento.where(
                  id_pais: ENV.fetch('SIVEL2_PAIS', '170').to_i).order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'departamento.id'
              },
              'SEXOS' => { 
                nomfiltro: :sexos,
                coleccion: Sip::Persona::sexo_opciones,
                metodo_etiqueta: false,
                metodo_id: false,
                campocons: 'persona.sexo'
              }
            }

            return f
          end # arma_estfiltrosm_gen

          def procesa_desagregarpor_om(que1, tablas1, where1, que3, tablas3, where3)
            tablas3 = cons1

            case @pDesagregarpor.to_s
            when ''
              que1 = agregar_tabla(que1, 'cast(\'total\' as text) as total')
              que3 << ["", ""]

            when "CATEGORIAS"
              que3 << ["nomcategoria", 'Cod. Categoria']
              que3 << ["id_tviolencia", 'T. Violencia']
              que3 << ["categoria", 'Categoria']

            when "DEPARTAMENTOS"
              que3 << ["departamento_nombre", "Departamento"]
              que3 << ["departamento_divipola", "Cod. Departamento"]

            when "FECHAS"
              que1 = agregar_tabla(que1, 'caso.fecha AS caso_fecha')
              que3 << ["caso_fecha", "Fecha"]

            when "SEXOS"
              que3 << ["sexo", "Sexo"]
              que1 = agregar_tabla(que1, 'persona.sexo AS sexo')

            else
              puts "opción desconocida pDesagregarpor=#{@pDesagregarpor}"
            end

            return que1, tablas1, where1, que3, tablas3, where3
          end


          def inicializa(where1)
            # Para la vista cons1 emplear que1, tablas1 y where1
            que1 = 'DISTINCT acto.id_caso, acto.id_persona, '\
              'acto.id_categoria, '\
              'supracategoria.id_tviolencia AS id_tviolencia, '\
              'categoria.nombre AS categoria, '\
              'supracategoria.id_tviolencia || categoria.id::text AS nomcategoria, '\
              'departamento.nombre AS departamento_nombre, '\
              'departamento.id_deplocal AS departamento_divipola '
            tablas1 = ' public.sivel2_gen_acto AS acto JOIN '\
              'public.sivel2_gen_caso AS caso ON acto.id_caso=caso.id '\
              'JOIN public.sivel2_gen_categoria AS categoria '\
              ' ON acto.id_categoria=categoria.id '\
              'JOIN public.sivel2_gen_supracategoria AS supracategoria '\
              ' ON categoria.supracategoria_id=supracategoria.id '\
              'JOIN public.sivel2_gen_victima AS victima '\
              ' ON victima.id_persona=acto.id_persona AND '\
              ' victima.id_caso=caso.id '\
              'JOIN public.sip_persona AS persona '\
              ' ON persona.id=acto.id_persona '\
              'JOIN public.sip_ubicacion AS ubicacion '\
              ' ON ubicacion.id=caso.ubicacion_id '\
              'LEFT JOIN public.sip_departamento AS departamento '\
              ' ON departamento.id=ubicacion.id_departamento '

            return [que1, tablas1, where1]
          end


          def consulta_final(i, que3, tablas3, where3, qc, gb)
            @coltotales = [i-1]
            que3 << ["", "Víctimizaciones"]
            twhere3 = where3 == "" ? "" : "WHERE " + where3
            q3="SELECT #{qc}
            COUNT(*) AS total
            FROM #{tablas3}
            #{twhere3}
            #{gb}"
            puts "OJO q3 es #{q3}"
            return q3
          end

#          def graficar
#            series_gen= []
#            if (@vic_dep.count == 0) || (@vic_categorias.count == 0)
#              flash.now[:info] = "Uno de los filros se encuentra vacío"
#            else
#              Sip::Persona::SEXO_OPCIONES.each do |sexo|
#                desagr = "persona.sexo ='#{sexo[1].to_s}'" 
#                filtros= ""
#                filtros << "
#              AND ubi.id_departamento IN (#{(@vic_dep).join(', ')})" if @vic_dep.count >= 1
#              filtros << "
#              AND categoria.id IN (#{@vic_categorias.join(', ')})" if @vic_categorias.count >= 1
#              valores_sex = ActiveRecord::Base.connection.execute(consulta_gen(desagr, filtros)).values.to_h 
#              presex = {name: sexo[0], data: valores_sex}
#              series_gen.push(presex)
#              end
#            end
#            return series_gen
#          end 


        end # included

      end
    end
  end
end
