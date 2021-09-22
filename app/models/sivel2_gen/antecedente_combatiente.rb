
require 'sivel2_gen/concerns/models/antecedente_combatiente'

module Sivel2Gen
  class AntecedenteCombatiente < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::AntecedenteCombatiente
  end
end
