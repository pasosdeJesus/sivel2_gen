module Sivel2Gen
  module Concerns
    module Models
      module ProfesionVictima 
        extend ActiveSupport::Concern
          included do
            belongs_to :profesion, foreign_key: "profesion_id",
              validate: true, class_name: 'Sivel2Gen::Profesion', 
              optional: false
            belongs_to :victima, foreign_key: "victima_id",
              validate: true, class_name: "Sivel2Gen::Victima", 
              optional: false
          end
      end
    end
  end
end
