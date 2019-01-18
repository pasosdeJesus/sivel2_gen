# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Organizacion
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
           has_and_belongs_to_many :victimacolectiva, 
                   class_name: 'Sivel2Gen::Victimacolectiva',
                   foreign_key: 'id_organizacion', 
                   validate: true, 
                   association_foreign_key: 'id_victimacolectiva',
                   join_table: 'sivel2_gen_organizacion_victimacolectiva' 

           has_many :victima, 
             foreign_key: 'id_organizacion', 
             class_name: 'Sivel2Gen::Victima' 

           has_many :combatiente, 
             class_name: 'Sivel2Gen::Combatiente',
             foreign_key: 'id_organizacion' 
        end
      end
    end
  end
end

