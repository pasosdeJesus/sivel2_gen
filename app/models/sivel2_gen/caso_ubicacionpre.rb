# frozen_string_literal: true

require "sivel2_gen/concerns/models/caso_ubicacionpre"

module Sivel2Gen
  class CasoUbicacionpre < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoUbicacionpre
  end
end
