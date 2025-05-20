# frozen_string_literal: true

require "msip/concerns/controllers/personas_controller"
require "date"

module Sivel2Gen
  module Concerns
    module Controllers
      module FamiliaresController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          include Msip::Concerns::Controllers::PersonasController
          before_action :prepara_familiar

          def crear_familiar
            @caso.id = params[:caso]
          end

          def eliminar_familiar
          end

          def genclase
            "F"
          end

          def update
          end

          private

          def prepara_familiar
            @victima = Sivel2Gen::Victima.new(persona: Msip::Persona.new)
            @caso = Sivel2Gen::Caso.new(victima: [@victima])
            @victima.persona.personados = [Msip::Persona.new]
          end
        end # included
      end
    end
  end
end
