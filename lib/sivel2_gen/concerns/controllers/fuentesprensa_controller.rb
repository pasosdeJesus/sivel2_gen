require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module FuentesprensaController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso
          before_action :setup_caso
          # Responde a requerimiento AJAX generado por cocoon creando una
          # nueva fuente de prensa para el caso que recibe por parametro 
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

          def setup_caso
            @caso = Sivel2Gen::Caso.new(caso_fuenteprensa: [Sivel2Gen::CasoFuenteprensa.new])
          end
        end # included

      end 
    end
  end
end
