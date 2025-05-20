# frozen_string_literal: true

require "sivel2_gen/concerns/models/presponsable"

module Sivel2Gen
  # Tabla Básica Presunto Responsable
  class Presponsable < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Presponsable
  end
end
