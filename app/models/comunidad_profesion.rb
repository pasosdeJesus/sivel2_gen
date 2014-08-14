# encoding: UTF-8
class ComunidadProfesion < ActiveRecord::Base
	belongs_to :profesion, foreign_key: "id_profesion", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
