# encoding: UTF-8
require 'date'

class PresponsablesController < ApplicationController
  load_and_authorize_resource

  # Crea un nuevo registro para el caso que recibe por parametro 
  # params[:caso_id].  Pone valores simples en los campos requeridos
  def nuevo
    if !params[:caso_id].nil?
      @presponsable = CasoPresponsable.new
      @presponsable.id_caso = params[:caso_id]
      @presponsable.id_presponsable = 35
      @presponsable.tipo = 0
      if @presponsable.save
        respond_to do |format|
          format.js { render text: @presponsable.id.to_s }
          format.json { render json: @presponsable.id.to_s, status: :created }
          format.html { render inline: @presponsable.id.to_s }
        end
      else
        respond_to do |format|
          format.html { render action: "error" }
          format.json { render json: @presponsable.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render inline: 'Falta identificacion del caso' }
      end
    end
  end
end
