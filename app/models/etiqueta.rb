# encoding: UTF-8
class Etiqueta < ActiveRecord::Base
	has_many :caso_etiqueta, dependent: :delete_all
	has_many :caso, through: :caso_etiqueta
end
