# encoding: UTF-8
class Idioma < ActiveRecord::Base
	has_many :casosjr, foreign_key: "id_idioma", validate: true

	validates_presence_of :nombre
	validates_presence_of :fechacreacion
end
