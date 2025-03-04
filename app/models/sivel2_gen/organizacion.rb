# frozen_string_literal: true

require "sivel2_gen/concerns/models/organizacion"

module Sivel2Gen
  # Tabla básica Organización
  class Organizacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Organizacion
  end
end
