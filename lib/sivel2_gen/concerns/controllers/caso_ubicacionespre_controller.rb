module Sivel2Gen
  module Concerns
    module Controllers
      module CasoUbicacionespreController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :prepara_caso

          def destroy
          end

          def create
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(
              caso_ubicacionpre: [Sivel2Gen::CasoUbicacionpre.new]
            )
          end

        end # included

      end
    end
  end
end

