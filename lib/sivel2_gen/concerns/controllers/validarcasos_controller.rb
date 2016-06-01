# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Controllers
      module ValidarcasosController
        extend ActiveSupport::Concern

        included do

          def validacion_estandar(casos, titulo, where, atr = [:id, :fecha],
                                  encabezado = ['Código', 'Fecha del Hecho'])
            res = casos.where(where).select(atr)
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

          def valida_sinmemo(cmemo = 'memo')
            sinmemo = ini_filtro
            validacion_estandar(sinmemo, 'Casos sin memo', 
                                "TRIM(#{cmemo})='' OR #{cmemo} IS NULL")
          end

          def validar_interno
            valida_sinmemo
          end

          def validar
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

