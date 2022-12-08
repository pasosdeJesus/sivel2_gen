
module Sivel2Gen
  class HogarController < Msip::HogarController

    # No define control de acceso por ser usada por no autenticados

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
      redirect_to Rails.configuration.relative_url_root
    end

  end
end
