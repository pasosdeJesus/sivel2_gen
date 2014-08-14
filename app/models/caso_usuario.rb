# encoding: UTF-8
class CasoUsuario < ActiveRecord::Base
	belongs_to :usuario, foreign_key: "id_usuario", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
