# encoding: UTF-8
module Sivel2Gen
  class Organizacion < ActiveRecord::Base
    include Basica

    has_many :comunidad_organizacion, foreign_key: "id_organizacion",
      validate: true, class_name: 'Sivel2Gen::ComunidadOrganizacion' 
    has_many :victima, foreign_key: "id_organizacion", 
      class_name: 'Sivel2Gen::Victima' 
  end
end
