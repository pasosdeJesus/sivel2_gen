# encoding: UTF-8
require 'date'

module Sivel2Gen
  class PersonasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Caso

    # Busca y lista persona(s)
    def index
      if !params[:term]
        respond_to do |format|
          format.html { render inline: 'Falta variable term' }
          format.json { render inline: 'Falta variable term' }
        end
      else
        term = Sivel2Gen::Caso.connection.quote_string(params[:term])
        consNomvic = term.downcase.strip #sin_tildes
        consNomvic.gsub!(/ +/, ":* & ")
        if consNomvic.length > 0
          consNomvic += ":*"
        end
        where = " to_tsvector('spanish', unaccent(persona.nombres) " +
          " || ' ' || unaccent(persona.apellidos) " +
          " || ' ' || COALESCE(persona.numerodocumento::TEXT, '')) @@ " +
          "to_tsquery('spanish', '#{consNomvic}')";

        partes = [
          'nombres',
          'apellidos',
          'COALESCE(numerodocumento::TEXT, \'\')'
        ]
        s = "";
        l = " persona.id ";
        seps = "";
        sepl = " || ';' || ";
        partes.each do |p|
          s += seps + p;
          l += sepl + "char_length(#{p})";
          seps = " || ' ' || ";
        end
        qstring = "SELECT TRIM(#{s}) AS value, #{l} AS id 
        FROM sivel2_gen_persona AS persona
        WHERE #{where} ORDER BY 1";

        r = ActiveRecord::Base.connection.select_all qstring
        respond_to do |format|
          format.json { render :json, inline: r.to_json }
        end
      end
    end

    
    # Busca y lista persona(s)
    def remplazar
      @persona = Persona.find(params[:id_persona].to_i)
      #@persona.current_usuario = current_usuario
      victima = Victima.find(params[:id_victima].to_i)
      personaant = victima.persona
      @caso = victima.caso
      @caso.current_usuario = current_usuario
      victima.persona = @persona
      victima.save!
      if (personaant.nombres == 'N' && personaant.apellidos == 'N') ||
        (personaant.nombres == '' && personaant.apellidos == '')
        personaant.destroy
      end
      respond_to do |format|
        format.html { render('remplazar', layout: false) }
      end
    end
  end
end
