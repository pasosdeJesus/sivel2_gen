
require 'sivel2_gen/concerns/models/otraorga_victima'

module Sivel2Gen
  # Relación n:n entre Víctima y Organización para modelar otras organizaciones
  class OtraorgaVictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::OtraorgaVictima
  end
end
