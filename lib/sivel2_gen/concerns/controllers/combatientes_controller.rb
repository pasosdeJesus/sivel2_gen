# frozen_string_literal: true

require "date"

module Sivel2Gen
  module Concerns
    module Controllers
      module CombatientesController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso
          before_action :prepara_caso

          # Crea un nuevo registro para el caso que recibe por parametro
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nuevo
            if params[:caso_id]
              @combatiente = Combatiente.new
              @combatiente.nombre = "N"
              @combatiente.sexo = Msip::Persona.convencion_sexo[:sexo_masculino].to_s
              @combatiente.resagresion_id = 1
              @combatiente.caso_id = params[:caso_id]
              if @combatiente.save
                respond_to do |format|
                  format.js { render(json: { "combatiente" => @combatiente.id.to_s }) }
                  format.json do
                    render(
                      json: { "combatiente" => @combatiente.id.to_s },
                      status: :created,
                    )
                  end
                  format.html { render(json: { "combatiente" => @combatiente.id.to_s }) }
                end
              else
                respond_to do |format|
                  format.html do
                    render(inline: "Error: " + @combatiente.errors.messages.to_s)
                  end
                  format.json do
                    render(
                      json: @combatiente.errors.messages,
                      status: :unprocessable_entity,
                    )
                  end
                end
              end
            else
              respond_to do |format|
                format.html { render(inline: "Falta identificacion del caso") }
              end
            end
          end

          def destroy
          end

          def create
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(
              combatiente: [Sivel2Gen::Combatiente.new],
            )
          end
        end # included
      end
    end
  end
end
