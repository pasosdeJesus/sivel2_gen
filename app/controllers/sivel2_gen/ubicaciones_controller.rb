# encoding: UTF-8
require 'date'

module Sivel2Gen
  class UbicacionesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Ubicacion

    # Crea un nuevo registro para el caso que recibe por parametro 
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nuevo
      if !params[:caso_id].nil?
        @ubicacion = Ubicacion.new
        @ubicacion.id_caso = params[:caso_id]
        @ubicacion.id_pais = 170
        if @ubicacion.save
          respond_to do |format|
            format.js { render text: @ubicacion.id.to_s }
            format.json { render json: @ubicacion.id.to_s, status: :created }
            format.html { render inline: @ubicacion.id.to_s }
          end
        else
          respond_to do |format|
            format.html { render action: "error" }
            format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
      end
    end

    def update
      if @caso.update(ubicacion_params)
        respond_to do |format|
          format.js { render text: @ubicacion.id.to_s }
          format.json { render json: @ubicacion.id.to_s, status: :updated }
          format.html { render inline: @ubicacion.id.to_s }
        end
      else
        respond_to do |format|
          format.html { render action: "error" }
          format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
        end
      end
    end

    def ubicacion_params
      params.require(:ubicacion).permit(
        :id, :id_pais, :id_departamento, :id_municipio, :id_clase, 
        :lugar, :sitio, :latitud, :longitud, :id_tsitio, 
        :_destroy
      )
    end
  end
end
