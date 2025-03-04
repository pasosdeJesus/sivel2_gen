# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Controllers
      module CasoFotrasController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso
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
            @caso = Sivel2Gen::Caso.new(caso_fotra: [Sivel2Gen::CasoFotra.new])
          end
        end # included
      end
    end
  end
end
