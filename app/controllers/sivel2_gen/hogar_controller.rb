# encoding: UTF-8

module Sivel2Gen
  class HogarController < Sip::HogarController

    def index
      if current_usuario
        authorize! :contar, Sivel2Gen::Caso
      end
      render layout: 'application'
    end

    def fichacasovertical
      if session[:capturacaso_acordeon]
        session[:capturacaso_acordeon] = false
      else
        session[:capturacaso_acordeon] = true
      end
      redirect_to "/"
    end

  end
end
