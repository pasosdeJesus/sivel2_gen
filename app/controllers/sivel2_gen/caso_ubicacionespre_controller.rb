# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/caso_ubicacionespre_controller"

module Sivel2Gen
  class CasoUbicacionespreController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoUbicacionpre
    include Sivel2Gen::Concerns::Controllers::CasoUbicacionespreController
  end
end
