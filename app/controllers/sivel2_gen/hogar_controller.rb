# encoding: UTF-8
module Sivel2Gen
  class HogarController < ApplicationController

    def tablasbasicas
      authorize! :manage, :tablasbasicas
      @ntablas = {}
      Ability::tablasbasicas.each { |t|
        k = Ability::tb_clase(t)
        n = k.human_attribute_name(t[1].pluralize.capitalize) 
        r = "admin/#{t[1].pluralize}"
          @ntablas[n] = r
      } 
      @ntablasor = @ntablas.keys.localize(:es).sort.to_a
      render layout: 'application'
    end

    def index
      if current_usuario
        authorize! :contar, Sivel2Gen::Caso
      end
      render layout: 'application'
    end

    def acercade
      render layout: 'application'
    end

    def fichacasovertical
      if session[:capturacaso_acordeon]
        session[:capturacaso_acordeon] = false
      else
        session[:capturacaso_acordeon] = true
      end
      redirect_to root_path
    end

  end
end
