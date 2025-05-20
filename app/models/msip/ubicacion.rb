# frozen_string_literal: true

require "sivel2_gen/concerns/models/ubicacion"

module Msip
  class Ubicacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Ubicacion
  end
end
