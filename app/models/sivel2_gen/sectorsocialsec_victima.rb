
require 'sivel2_gen/concerns/models/sectorsocialsec_victima'

module Sivel2Gen
  # Relación n:n entre Sector social y Víctima
  class SectorsocialsecVictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::SectorsocialsecVictima
  end
end
