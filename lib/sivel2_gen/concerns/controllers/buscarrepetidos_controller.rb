# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Controllers
      module BuscarrepetidosController
        extend ActiveSupport::Concern

        included do

          def reportar
            authorize! :read, Sivel2Gen::Caso
            @rango_fechas = 'Fecha del hecho'
            @titulo = 'Reporte de Repetidos'
            @repetidos = []

            rf=""

            if (params[:buscarrepetido] && 
                params[:buscarrepetido][:fechaini] && 
                params[:buscarrepetido][:fechaini] != '')
              pfi = params[:buscarrepetido][:fechaini]
              if Rails.application.config.x.formato_fecha == 'dd-mm-yyyy'
                pfid = Date.strptime(pfi, '%d-%m-%Y')
              else
                pfid = Date.strptime(pfi, '%Y-%m-%d')
              end
              rf += " AND c1.fecha >= #{pfid.strftime('%Y-%m-%d')}" +
                " AND c2.fecha >= #{pfid.strftime('%Y-%m-%d')}" 
            end
            if(params[:buscarrepetido] && params[:buscarrepetido][:fechafin] && 
               params[:buscarrepetido][:fechafin] != '')
              pff = params[:buscarrepetido][:fechafin]
              if Rails.application.config.x.formato_fecha == 'dd-mm-yyyy'
                pffd = Date.strptime(pff, '%d-%m-%Y')
              else
                pffd = Date.strptime(pff, '%Y-%m-%d')
              end
              rf += " AND c1.fecha <= #{pffd.strftime('%Y-%m-%d')}" +
                " AND c2.fecha <= #{pffd.strftime('%Y-%m-%d')}" 
            end
            res = Sivel2Gen::Caso.connection.select_all("
              SELECT DISTINCT gr 
              FROM (SELECT id, ARRAY(SELECT id FROM sivel2_gen_caso AS c2 
                    WHERE c2.memo=c1.memo#{rf}) AS gr 
                    FROM sivel2_gen_caso AS c1 ORDER BY id) AS s 
              WHERE array_length(gr, 1) > 1"
            )
            @repetidos << {
              titulo: 'Reporte de Casos con descripción repetida',
              encabezado: ['Grupo con igual descripción'],
              cuerpo: res
            }
            respond_to do |format|
              format.html { 
                render 'sivel2_gen/buscarrepetidos/reportar', 
                  layout: 'application' 
              }
              format.json { head :no_content }
              format.js   { head :no_content }
            end
          end # def reportar
          
          def buscarrepetidos_params
            params.require(:buscarrepetido).permit(
              :fechafin,
              :fechaini
            )
          end

        end

      end
    end
  end
end

