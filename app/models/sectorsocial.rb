# encoding: UTF-8
class Sectorsocial < ActiveRecord::Base
  include Basica

	has_many :comunidad_sectorsocial, foreign_key: "id_sectorsocial", 
    validate: true
	has_many :victima, foreign_key: "id_sectorsocial", validate: true
end
