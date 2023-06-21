module Sivel2Gen
  module Concerns
    module Controllers
      module CasoSolicitudesController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :prepara_caso

          def new
          end 

          def destroy
          end

          def create
          end

          def update
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(
              caso_solicitud: [Sivel2Gen::CasoSolicitud.new]
            )
          end

        end # included

      end
    end
  end
end

