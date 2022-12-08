
module Sivel2Gen
  module Concerns
    module Models
      module Sectorsocial
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_many :sectorsocial_victimacolectiva, 
                  foreign_key: "id_sectorsocial", 
                  validate: true, 
                  class_name: 'Sivel2Gen::SectorsocialVictimacolectiva'
          has_many :victima, foreign_key: "id_sectorsocial", validate: true, 
                  class_name: 'Sivel2Gen::Victima'
          has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
            foreign_key: "id_sectorsocial" 
        end
      end
    end
  end
end

