
module Sivel2Gen
  module Concerns
    module Models
      module Resagresion
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_many :combatiente, foreign_key: "resagresion_id", 
            validate: true, class_name: 'Sivel2Gen::Combatiente'
        end

      end
    end
  end
end
