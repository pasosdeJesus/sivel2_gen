
require 'sivel2_gen/concerns/models/combatiente'

module Sivel2Gen
  # Combatiente relacionado con un caso
  class Combatiente < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Combatiente
  end
end
