
require 'sivel2_gen/concerns/models/antecedente_combatiente'

module Sivel2Gen
  # Relación n:n entre antecedentes y combatientes
  class AntecedenteCombatiente < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::AntecedenteCombatiente
  end
end
