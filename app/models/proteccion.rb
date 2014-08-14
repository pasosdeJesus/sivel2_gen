# encoding: UTF-8
class Proteccion < ActiveRecord::Base
	has_many :casosjr, foreign_key: "id_proteccion", validate: true

	validates_presence_of :nombre
	validates_presence_of :fechacreacion
end
