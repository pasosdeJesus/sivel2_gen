require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module CasoAnexosController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Victima
          before_action :prepara_caso

          def clase
            "Sivel2Gen::CasoAnexo"
          end


          def nuevo
          end

          def destroy
          end

          def create
          end

          def update
          end

          def set_anexo_caso
            @anexocaso = Sivel2Gen::AnexoCaso.find(params[:id])
            @registro = @anexocaso
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(anexo_caso: [Sivel2Gen::AnexoCaso.new])
          end
        end # included

      end 
    end
  end
end

