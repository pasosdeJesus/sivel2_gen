require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module AnexoCasosController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::AnexoCaso

          before_action :prepara_caso

          def clase
            "Sivel2Gen::AnexoCaso"
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
<<<<<<< HEAD
            @caso = Sivel2Gen::Caso.new(
              anexo_caso: [Sivel2Gen::AnexoCaso.new])
=======
            @caso = Sivel2Gen::Caso.new(anexo_caso: [Sivel2Gen::AnexoCaso.new])
>>>>>>> 9e7dedf2 (avanza anexos con turbo)
          end
        end # included

      end 
    end
  end
end

