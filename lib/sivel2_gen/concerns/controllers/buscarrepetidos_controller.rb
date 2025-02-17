# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Controllers
      module BuscarrepetidosController
        extend ActiveSupport::Concern

        included do
          def reportar
            authorize!(:read, Sivel2Gen::Caso)
            @rango_fechas = "Fecha del hecho"
            @titulo = "Reporte de casos repetidos"
            @repetidos = []

            rf = ""

            if params[:buscarrepetido] &&
                params[:buscarrepetido][:fechaini] &&
                params[:buscarrepetido][:fechaini] != ""
              pfi = params[:buscarrepetido][:fechaini]
              pfid = Msip::FormatoFechaHelper.fecha_local_estandar(pfi)
              rf += " AND c1.fecha >= '#{pfid}'" +
                " AND c2.fecha >= '#{pfid}'"
            end
            if params[:buscarrepetido] && params[:buscarrepetido][:fechafin] &&
                params[:buscarrepetido][:fechafin] != ""
              pff = params[:buscarrepetido][:fechafin]
              pffd = Msip::FormatoFechaHelper.fecha_local_estandar(pff)
              rf += " AND c1.fecha <= '#{pffd}'" +
                " AND c2.fecha <= '#{pffd}'"
            end
            res = Sivel2Gen::Caso.connection.select_all("
              SELECT DISTINCT '[' || ARRAY_TO_STRING(gr, ',') || ']'
              FROM (SELECT id, ARRAY(SELECT id FROM sivel2_gen_caso AS c2
                    WHERE c2.memo=c1.memo#{rf}) AS gr
                    FROM sivel2_gen_caso AS c1 ORDER BY id) AS s
              WHERE array_length(gr, 1) > 1")
            @repetidos << {
              titulo: "Reporte de Casos con descripción repetida",
              encabezado: ["Grupo con igual descripción"],
              cuerpo: res,
            }
            respond_to do |format|
              format.html do
                render(
                  "sivel2_gen/buscarrepetidos/reportar",
                  layout: "application",
                )
              end
              format.json { head(:no_content) }
              format.js   { head(:no_content) }
            end
          end # def reportar

          def buscarrepetidos_params
            params.require(:buscarrepetido).permit(
              :fechafin,
              :fechaini,
            )
          end
        end
      end
    end
  end
end
