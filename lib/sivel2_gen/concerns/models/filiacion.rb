# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Filiacion
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
                self.table_name = "sivel2_gen_filiacion"
                has_many :filiacion_victimacolectiva, 
                        foreign_key: "id_filiacion", 
                        validate: true, 
                        class_name: 'Sivel2Gen::FiliacionVictimacolectiva'
                has_many :victima, foreign_key: "id_filiacion", 
                        class_name: 'Sivel2Gen::Victima'
                has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
                        foreign_key: "id_profesion" 
        end
      end
    end
  end
end

