
module Sivel2Gen
  module Concerns
    module Models
      module AntecedenteCombatiente
        extend ActiveSupport::Concern

        included do
          belongs_to :antecedente, foreign_key: "id_antecedente", 
            validate: true, optional: false
          belongs_to :combatiente, foreign_key: "id_victima", 
            validate: true, optional: false
        end
      end
    end
  end
end

