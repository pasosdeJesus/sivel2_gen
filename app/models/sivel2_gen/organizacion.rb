# encoding: UTF-8
module Sivel2Gen
  class Organizacion < ActiveRecord::Base
    include Sip::Basica

    has_many :organizacion_victimacolectiva, foreign_key: "id_organizacion",
      validate: true, class_name: 'Sivel2Gen::OrganizacionVictimacolectiva' 
    has_many :victima, foreign_key: "id_organizacion", 
      class_name: 'Sivel2Gen::Victima' 
  end
end
