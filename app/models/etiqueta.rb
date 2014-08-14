# encoding: UTF-8
class Etiqueta < ActiveRecord::Base
	has_many :etiqueta_usuario, dependent: :delete_all
	has_many :usuario, through: :etiqueta_usuario
end
