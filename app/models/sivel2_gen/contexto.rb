# frozen_string_literal: true

require "sivel2_gen/concerns/models/contexto"

module Sivel2Gen
  # Tabla básica contexto (de un caso)
  class Contexto < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Contexto
  end
end
