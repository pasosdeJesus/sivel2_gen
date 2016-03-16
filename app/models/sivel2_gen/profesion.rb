# encoding: UTF-8
module Sivel2Gen
  class Profesion < ActiveRecord::Base
    include Sip::Basica

    has_many :profesion_victimacolectiva, foreign_key: "id_profesion", 
            validate: true, class_name: 'Sivel2Gen::ProfesionVictimacolectiva'
    has_many :victima, foreign_key: "id_profesion", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
