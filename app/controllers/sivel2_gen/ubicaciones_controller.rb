require 'date'

module Sivel2Gen
  class UbicacionesController < ApplicationController
    load_and_authorize_resource class: Msip::Ubicacion

    # Crea un nuevo registro para el caso que recibe por parametro 
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nuevo
      if !params[:caso_id].nil?
        @ubicacion = Msip::Ubicacion.new
        @ubicacion.caso_id = params[:caso_id]
        @ubicacion.pais_id = Msip.paisomision
        if @ubicacion.save(validate: false)
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
        :id, :pais_id, :departamento_id, :municipio_id, :clase_id, 
        :lugar, :sitio, :latitud, :longitud, :tsitio_id, 
        :_destroy
      )
    end
  end
end
