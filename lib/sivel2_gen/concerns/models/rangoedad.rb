# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Rangoedad
        extend ActiveSupport::Concern

          include Sip::Basica
          included do
            has_many :rangoedad_victimacolectiva, foreign_key: 'id_rangoedad', 
              validate: true, class_name: 'Sivel2Gen::RangoedadVictimacolectiva'
            has_many :victima, foreign_key: 'id_rangoedad', validate: true, 
              class_name: 'Sivel2Gen::Victima'
            has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
              foreign_key: 'id_rangoedad' 

            validates :nombre, length: { maximum: 20 }
            validates :observaciones, length: { maximum: 5000 }
        end
      end
    end
  end
end


# encoding: UTF-8
module Sivel2Gen
  class Rangoedad < ActiveRecord::Base
    include Sip::Basica

  end
end
