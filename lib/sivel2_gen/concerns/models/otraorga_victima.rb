module Sivel2Gen
  module Concerns
    module Models
      module OtraorgaVictima 

        extend ActiveSupport::Concern
        included do
          belongs_to :organizacion, foreign_key: "organizacion_id",
            validate: true, class_name: 'Sivel2Gen::Organizacion'
          belongs_to :victima, foreign_key: "victima_id",
            validate: true, class_name: "Sivel2Gen::Victima"
        end
      end
    end
  end
end
