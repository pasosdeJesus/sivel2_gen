# frozen_string_literal: true

require "sivel2_gen/concerns/models/rangoedad"

module Sivel2Gen
  # Tabla básica Rango de Edad
  class Rangoedad < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Rangoedad
  end
end
