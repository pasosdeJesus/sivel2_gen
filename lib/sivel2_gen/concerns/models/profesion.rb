# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Profesion
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          has_many :profesion_victimacolectiva, foreign_key: "id_profesion", 
            validate: true, class_name: 'Sivel2Gen::ProfesionVictimacolectiva'
          has_many :victima, foreign_key: "id_profesion", validate: true, 
            class_name: 'Sivel2Gen::Victima'
          has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
            foreign_key: "id_profesion" #, dependent: :delete_all
        end
      end
    end
  end
end

