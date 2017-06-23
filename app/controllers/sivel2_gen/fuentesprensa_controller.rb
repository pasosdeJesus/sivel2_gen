# encoding: UTF-8
require 'date'

module Sivel2Gen
  class FuentesprensaController < ApplicationController
    load_and_authorize_resource class: Sip::Fuenteprensa
    
    # Responde a requerimiento AJAX generado por cocoon creando una
    # nueva fuente de prensa para el caso que recibe por parametro 
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nuevo
      if !params[:caso_id].nil?
        @fprensa = CasoFuenteprensa.new
        @fprensa.id_caso = params[:caso_id]
        @fprensa.fuenteprensa_id = 0
        @fprensa.fecha = Date.today
        if @fprensa.save
          respond_to do |format|
            format.js { render text: @fpresna.id.to_s }
            format.json { render json: @fprensa.id.to_s, status: :created }
            format.html { render inline: @fprensa.id.to_s }
          end
        else
          respond_to do |format|
            format.html { render action: "error" }
            format.json { render json: @fprensa.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
      end
    end # def nuevo

    end # class FuentesprensaController
end # module Sivel2Gen
