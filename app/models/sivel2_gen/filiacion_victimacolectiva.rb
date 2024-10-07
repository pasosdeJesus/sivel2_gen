require 'sivel2_gen/concerns/models/filiacion_victimacolectiva'

module Sivel2Gen
  # Relación n:n entre Filiación política y víctima colectiva
  class FiliacionVictimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::FiliacionVictimacolectiva
  end
end
