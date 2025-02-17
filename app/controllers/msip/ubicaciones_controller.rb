# frozen_string_literal: true

require "msip/concerns/controllers/ubicaciones_controller"

module Msip
  class UbicacionesController < ApplicationController
    include Msip::Concerns::Controllers::UbicacionesController

    def nuevo_completa_ubicacion
      @ubicacion.caso_id = params[:caso_id]
    end
  end
end
