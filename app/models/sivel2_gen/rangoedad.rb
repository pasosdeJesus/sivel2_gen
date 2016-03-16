# encoding: UTF-8
module Sivel2Gen
  class Rangoedad < ActiveRecord::Base
    include Sip::Basica

    has_many :rangoedad_victimacolectiva, foreign_key: "id_rangoedad", 
            validate: true, class_name: 'Sivel2Gen::RangoedadVictimacolectiva'
    has_many :victima, foreign_key: "id_rangoedad", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
