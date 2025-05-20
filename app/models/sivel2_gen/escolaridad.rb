# frozen_string_literal: true

require "sivel2_gen/concerns/models/escolaridad"

module Sivel2Gen
  # Tabla básica Escolaridad
  class Escolaridad < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Escolaridad
  end
end
