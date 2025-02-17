# frozen_string_literal: true

require "sivel2_gen/concerns/models/filiacion"

module Sivel2Gen
  # Tabla básica filiación política
  class Filiacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Filiacion
  end
end
