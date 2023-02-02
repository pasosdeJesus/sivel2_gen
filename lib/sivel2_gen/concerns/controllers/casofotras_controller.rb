
require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module CasofotrasController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso
          before_action :prepara_caso
          # Crea un nuevo registro para el caso que recibe por parametro 
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def new          
          end # def nuevo

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

