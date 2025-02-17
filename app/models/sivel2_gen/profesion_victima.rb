# frozen_string_literal: true

require "sivel2_gen/concerns/models/profesion_victima"

module Sivel2Gen
  # Relación n:n entre Profesión y Víctima
  class ProfesionVictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::ProfesionVictima
  end
end
