# encoding: UTF-8

require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module CasofotrasController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso

          # Crea un nuevo registro para el caso que recibe por parametro 
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nuevo
            if params[:caso_id]
              @casofotra = Sivel2Gen::CasoFotra.new
              @casofotra.id_caso = params[:caso_id]
              @casofotra.nombre = 'N'
              mdate = Sivel2Gen::CasoFotra.where(
                id_caso: params[:caso_id]).maximum(:fecha)
              if mdate
                mdate = mdate + 1
              else
                mdate = Sivel2Gen::Caso.where(id: params[:caso_id]).count > 0 ?
                  Sivel2Gen::Caso.find(params[:caso_id]).fecha + 2: Date.today
              end
              @casofotra.fecha = mdate
              if @casofotra.save
                respond_to do |format|
                  format.js { render text: @casofotra.id.to_s }
                  format.json { render json: @casofotra.id.to_s, status: :created }
                  format.html { render inline: @casofotra.id.to_s }
                end
              else
                respond_to do |format|
                  format.html { render action: "error" }
                  format.json { render json: @casofotra.errors, 
                    status: :unprocessable_entity }
                end
              end
            else
              respond_to do |format|
                format.html { render inline: 'Falta identificacion del caso' }
              end
            end
          end # def nuevo

        end # included

      end 
    end
  end
end

