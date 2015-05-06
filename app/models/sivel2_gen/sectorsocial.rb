# encoding: UTF-8
module Sivel2Gen
  class Sectorsocial < ActiveRecord::Base
    include Sip::Basica

    has_many :comunidad_sectorsocial, foreign_key: "id_sectorsocial", 
      validate: true, class_name: 'Sivel2Gen::ComunidadSectorsocial'
    has_many :victima, foreign_key: "id_sectorsocial", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
