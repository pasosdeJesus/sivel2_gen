
module Sivel2Gen
  module Concerns
    module Models
      module AntecedenteCombatiente
        extend ActiveSupport::Concern

        included do
          belongs_to :antecedente, foreign_key: "antecedente_id", 
            validate: true, optional: false
          belongs_to :combatiente, foreign_key: "combatiente_id", 
            validate: true, optional: false
        end
      end
    end
  end
end

