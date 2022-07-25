require 'date'
module Sivel2Gen
  class CombatientesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Combatiente

    # Crea un nuevo registro para el caso que recibe por parametro 
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nuevo
      if params[:caso_id]
        @combatiente = Combatiente.new
        @combatiente.nombre = 'N'
        @combatiente.sexo = Sip::Persona.convencion_sexo[:sexo_sinformacion].to_s
        @combatiente.id_resagresion = 1
        @combatiente.id_caso = params[:caso_id]
        if @combatiente.save
          respond_to do |format|
            format.js { render json: {'combatiente' => @combatiente.id.to_s } }
            format.json { render json: {'combatiente' => @combatiente.id.to_s },
                                        status: :created } 
            format.html { render json: {'combatiente' => @combatiente.id.to_s } }
          end
        else
          respond_to do |format|
            format.html { render action: 'error' }
            format.json { render json: @combatiente.errors, 
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
