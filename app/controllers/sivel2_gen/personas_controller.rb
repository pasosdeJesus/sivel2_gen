# encoding: UTF-8
require 'date'

module Sivel2Gen
  class PersonasController < Sip::PersonasController
    load_and_authorize_resource class: Sip::Persona
    
    # Busca y lista persona(s)
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
