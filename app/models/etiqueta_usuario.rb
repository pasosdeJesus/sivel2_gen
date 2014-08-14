# encoding: UTF-8
class EtiquetaUsuario < ActiveRecord::Base
	belongs_to :etiqueta
	belongs_to :usuario
end
