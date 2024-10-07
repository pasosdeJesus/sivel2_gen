
require 'sivel2_gen/concerns/models/contextovictima_victima'

module Sivel2Gen
  # Relación n:n entre Contexto de una víctima y Víctima
  class ContextovictimaVictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::ContextovictimaVictima
  end
end
