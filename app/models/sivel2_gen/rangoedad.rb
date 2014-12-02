# encoding: UTF-8
module Sivel2Gen
  class Rangoedad < ActiveRecord::Base
    include Basica

    has_many :comunidad_rangoedad, foreign_key: "id_rangoedad", validate: true, 
      class_name: 'Sivel2Gen::ComunidadRangoedad'
    has_many :victima, foreign_key: "id_rangoedad", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
