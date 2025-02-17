# frozen_string_literal: true

require "sivel2_gen/concerns/models/vinculoestado"

module Sivel2Gen
  # Tabla básica Vinculo con el Estado. Registra varios tipos de cargos con el estado.
  class Vinculoestado < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Vinculoestado
  end
end
