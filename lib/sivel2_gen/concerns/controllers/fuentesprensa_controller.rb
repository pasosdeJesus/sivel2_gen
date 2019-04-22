# encoding: UTF-8

require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module FuentesprensaController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Caso

          # Responde a requerimiento AJAX generado por cocoon creando una
          # nueva fuente de prensa para el caso que recibe por parametro 
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nuevo
            if !params[:caso_id].nil?
              @fprensa = CasoFuenteprensa.new
              @fprensa.id_caso = params[:caso_id]
              @fprensa.fuenteprensa_id = 0
              mdate = Sivel2Gen::CasoFuenteprensa.where(
                id_caso: params[:caso_id], fuenteprensa_id: 0).maximum(:fecha)
              if mdate.nil?
                mdate = Date.today
              else
                mdate = mdate + 1
              end
              @fprensa.fecha = mdate
              if @fprensa.save
                respond_to do |format|
                  format.js { render text: @fprensa.id.to_s }
                  format.json { render json: @fprensa.id.to_s, 
                    status: :created }
                  format.html { render inline: @fprensa.id.to_s }
                end
              else
                respond_to do |format|
                  format.html { 
                    render inline: "No pudo guardar fuente frecuente: '#{@fprensa.errors.message.to_s}'" }
                  format.json { render json: @fprensa.errors, status: :unprocessable_entity }
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
