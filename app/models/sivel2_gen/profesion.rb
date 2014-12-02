# encoding: UTF-8
module Sivel2Gen
  class Profesion < ActiveRecord::Base
    include Basica

    has_many :comunidad_profesion, foreign_key: "id_profesion", validate: true, 
      class_name: 'Sivel2Gen::ComunidadProfesion'
    has_many :victima, foreign_key: "id_profesion", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
