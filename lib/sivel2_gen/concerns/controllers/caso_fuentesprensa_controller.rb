# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Controllers
      module CasoFuentesprensaController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso
          before_action :preparar_caso

          def destroy
          end

          def create
          end

          private

          def preparar_caso
            @caso = Sivel2Gen::Caso.new(
              caso_fuenteprensa: [Sivel2Gen::CasoFuenteprensa.new],
            )
          end
        end # included
      end
    end
  end
end
