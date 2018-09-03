# encoding: UTF-8
require 'date'
require 'svel2_gen/concerns/controllers/personas_controller' 

module Sip
  class PersonasController < ApplicationController
    include Sivel2Gen::Concerns::Controllers::PersonasController
    load_and_authorize_resource class: Sip::Persona
   
    def remplazar
      @persona = Sip::Persona.find(params[:id_persona].to_i)
      @victima = Sivel2Gen::Victima.find(params[:id_victima].to_i)
      personaant = @victima.persona
      @caso = @victima.caso
      @caso.current_usuario = current_usuario
      @victima.persona = @persona
      @victima.save!
      if (personaant.nombres == 'N' && personaant.apellidos == 'N') ||
        (personaant.nombres == '' && personaant.apellidos == '')
        personaant.destroy
      end
      respond_to do |format|
        format.html { render('/sip/personas/remplazar', layout: false) }
      end
    end

  end
end
