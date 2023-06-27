
module Sivel2Gen
  module Concerns
    module Controllers
      module CasoEtiquetasController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper
          load_and_authorize_resource class: Sivel2Gen::Caso
          before_action :prepara_caso
          # Crea una nueva etiqueta para el caso que recibe por parametro
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nueva
            if params[:caso_id]
              @casoetiqueta = Sivel2Gen::CasoEtiqueta.new
              @casoetiqueta.caso_id = params[:caso_id]
              @casoetiqueta.etiqueta_id = Msip::Etiqueta.count > 0 ? Msip::Etiqueta.take.id : 0
              @casoetiqueta.usuario_id = current_usuario.id
              @casoetiqueta.fecha = Date.today
              if @casoetiqueta.save
                respond_to do |format|
                  format.js { render text: @casoetiqueta.id.to_s }
                  format.json { render json: @casoetiqueta.id.to_s, status: :created }
                  format.html { render inline: @casoetiqueta.id.to_s }
                end
              else
                respond_to do |format|
                  format.html {
                    render inline: "error: #{@casoetiqueta.errors.messages} "
                  }
                  format.json { render json: @casoetiqueta.errors.messages,
                    status: :unprocessable_entity }
                end
              end
            else
              respond_to do |format|
                format.html { render inline: 'Falta identificacion del caso' }
              end
            end
          end # def nueva

          def destroy
          end

          def create
          end

          def update
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(caso_etiqueta: [Sivel2Gen::CasoEtiqueta.new])
          end


        end # included

      end
    end
  end
end

