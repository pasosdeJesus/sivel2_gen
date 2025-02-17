# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Controllers
      module PresponsablesController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          def clase
            "Sivel2Gen::Presponsable"
          end

          def atributos_index
            [
              :id,
              :nombre,
              :papa,
              :observaciones,
              :fechacreacion_localizada,
              :habilitado,
            ]
          end

          def arma_arbol(papa_id, nombre_papa)
            hijos = Sivel2Gen::Presponsable.habilitados.where(papa_id: papa_id)
            hijosa = hijos.map do |h|
              arma_arbol(h.id, h.nombre)
            end
            { id: papa_id, nombre: nombre_papa, hijos: hijosa }
          end

          def arbol
            @arbolpresp = arma_arbol(nil, "")
            render("arbol", layout: "application")
          end

          def set_presponsable
            if params[:id].to_i > 0
              @basica = Presponsable.find(params[:id])
            end
          end

          def genclase
            "M"
          end

          # Crea un nuevo registro para el caso que recibe por parámetro
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nuevo
            if !params[:caso_id].nil?
              @presponsable = CasoPresponsable.new
              @presponsable.caso_id = params[:caso_id]
              @presponsable.presponsable_id = 35
              @presponsable.tipo = 0
              if @presponsable.save
                respond_to do |format|
                  format.js { render(text: @presponsable.id.to_s) }
                  format.json { render(json: @presponsable.id.to_s, status: :created) }
                  format.html { render(inline: @presponsable.id.to_s) }
                end
              else
                respond_to do |format|
                  format.html { render(action: "error") }
                  format.json { render(json: @presponsable.errors, status: :unprocessable_entity) }
                end
              end
            else
              respond_to do |format|
                format.html { render(inline: "Falta identificacion del caso") }
              end
            end
          end

          def lista_params
            atributos_form - [:papa] + [:papa_id]
          end

          def presponsable_params
            params.require(:presponsable).permit(*lista_params)
          end
        end # included
      end
    end
  end
end
