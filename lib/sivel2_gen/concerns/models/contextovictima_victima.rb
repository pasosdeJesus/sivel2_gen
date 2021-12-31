
module Sivel2Gen
  module Concerns
    module Models
      module ContextovictimaVictima 

        extend ActiveSupport::Concern

        included do
          belongs_to :contextovictima, foreign_key: "contextovictima_id",
            validate: true,
            class_name: 'Sivel2Gen::Contextovictima', optional: false
          belongs_to :victima, foreign_key: "victima_id",
            validate: true,
            class_name: 'Sivel2Gen::Victima', optional: false
        end
      end
    end
  end
end
