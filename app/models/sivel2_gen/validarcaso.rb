# frozen_string_literal: true

require "sivel2_gen/concerns/models/validarcaso"

module Sivel2Gen
  # Modelo virtual para presentar reporte de validación de casos
  class Validarcaso
    include Sivel2Gen::Concerns::Models::Validarcaso
  end
end
