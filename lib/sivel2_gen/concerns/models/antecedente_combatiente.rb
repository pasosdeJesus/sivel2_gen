# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module AntecedenteCombatiente
        extend ActiveSupport::Concern

        included do
          belongs_to :antecedente,
            validate: true,
            optional: false
          belongs_to :combatiente,
            validate: true,
            optional: false
        end
      end
    end
  end
end
