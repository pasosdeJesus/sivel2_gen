# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Organizacion
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
           has_many :organizacion_victimacolectiva, 
                   foreign_key: "id_organizacion", 
                   validate: true, 
                   class_name: 'Sivel2Gen::OrganizacionVictimacolectiva' 
           has_many :victima, foreign_key: "id_organizacion", 
                   class_name: 'Sivel2Gen::Victima' 
           has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
                   foreign_key: "id_organizacion" 
        end
      end
    end
  end
end

