# encoding: UTF-8
class Organizacion < ActiveRecord::Base
  include Basica

	has_many :comunidad_organizacion, foreign_key: "id_organizacion", validate: true
	has_many :victima, foreign_key: "id_organizacion"
end
