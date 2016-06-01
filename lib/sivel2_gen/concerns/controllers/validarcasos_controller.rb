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

          def ini_filtro(cfecha = 'fecha')
            casos = Sivel2Gen::Caso.all.order(cfecha)
            if (params[:validar] && params[:validar][:fechaini] && params[:validar][:fechaini] != '')
              pfi = params[:buscar][:fechaini]
              if Rails.application.config.x.formato_fecha == 'dd-mm-yyyy'
                pfid = Date.strptime(pfi, '%d-%m-%Y')
              else
                pfid = Date.strptime(pfi, '%Y-%m-%d')
              end
              casos = casos.where("#{cfecha} >= ?", pfid.strftime('%Y-%m-%d'))
            end
            if(params[:validar] && params[:validar][:fechafin] && params[:validar][:fechafin] != '')
              pff = params[:validar][:fechafin]
              if Rails.application.config.x.formato_fecha == 'dd-mm-yyyy'
                pffd = Date.strptime(pff, '%d-%m-%Y')
              else
                pffd = Date.strptime(pff, '%Y-%m-%d')
              end
              casos = casos.where("#{cfecha} <= ?", pffd.strftime('%Y-%m-%d'))
            end
            return casos
          end

          def valida_sinmemo(cmemo = 'memo')
            sinmemo = ini_filtro
            validacion_estandar(sinmemo, 'Casos sin memo', 
                                "TRIM(#{cmemo})='' OR #{cmemo} IS NULL")
          end

          def validar
            @titulo_validarcasos = 'Reporte de Validaciones'
            @validaciones = []
            valida_sinmemo
          end # def validar
          
        end

      end
    end
  end
end

