# encoding: UTF-8
require 'date'
require 'sip/concerns/controllers/gruposper_controller' 

module Sip
  class GruposperController < ApplicationController
    include Sip::Concerns::Controllers::GruposperController
   
    # Busca y lista grupo(s) de persona
    def remplazar
      @grupoper = Sip::Grupoper.find(params[:id_grupoper].to_i)
      victimac = Sivel2Gen::Victimacolectiva.find(params[:id_victimacolectiva].to_i)
      grupoperant = victimac.grupoper
      @caso = victimac.caso
      @caso.current_usuario = current_usuario
      victimac.grupoper = @grupoper
      victimac.save!
      if (grupoperant.nombre == 'N') ||
        (grupoperant.nombre == '')
        grupoperant.destroy
      end
      respond_to do |format|
        format.html { render('remplazar', layout: false) }
      end
    end
  end
end
