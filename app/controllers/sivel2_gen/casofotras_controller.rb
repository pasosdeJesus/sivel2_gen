# encoding: UTF-8
require 'date'

module Sivel2Gen
  class CasofotrasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Caso

    # Crea un nuevo registro para el caso que recibe por parametro 
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nuevo
      if params[:caso_id]
#        @fotra = Fotra.new
#        @fotra.nombre = 'N'
#        if !@fotra.save
#          respond_to do |format|
#            format.html { render inline: 'No pudo crear fuente' }
#          end
#          return
#        end
        @casofotra = Sivel2Gen::CasoFotra.new
        @casofotra.id_caso = params[:caso_id]
        @casofotra.nombre = 'N'
        @casofotra.fecha = Date.today
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

  end # class
end # module
