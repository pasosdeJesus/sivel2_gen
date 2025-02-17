# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/caso_solicitudes_controller"

module Sivel2Gen
  class CasoSolicitudesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoSolicitud
    include Sivel2Gen::Concerns::Controllers::CasoSolicitudesController
  end
end
