require 'sivel2_gen/concerns/models/profesion_victima'

module Sivel2Gen
  class ProfesionVictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::ProfesionVictima
  end
end
