# encoding: UTF-8
require 'date'
module Sivel2Gen
  class VictimascolectivasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Victimacolectiva

    # Crea un nuevo registro para el caso que recibe por parametro 
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nuevo
      if params[:caso_id]
        @grupoper = Sip::Grupoper.new
        @victimacolectiva = Victimacolectiva.new
        @grupoper.nombre = 'N'
        if !@grupoper.save
          respond_to do |format|
            format.html { render inline: 'No pudo crear grupoper' }
          end
          return
        end
        @victimacolectiva.id_caso = params[:caso_id]
        @victimacolectiva.id_grupoper = @grupoper.id
        if @victimacolectiva.save
          respond_to do |format|
            format.js { render json: {
              'victimacolectiva' => @victimacolectiva.id.to_s,
              'grupoper' => @grupoper.id.to_s} }
            format.json { render json: {
              'victimacolectiva' => @victimacolectiva.id.to_s,
              'grupoper' => @grupoper.id.to_s}, status: :created }
            format.html { render json: {
              'victimacolectiva' => @victimacolectiva.id.to_s,
              'grupoper' => @grupoper.id.to_s} }
          end
        else
          respond_to do |format|
            format.html { render action: "error" }
            format.json { render json: @victimacolectiva.errors, 
                          status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
      end
    end
  end
end
