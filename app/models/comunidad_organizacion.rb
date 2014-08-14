# encoding: UTF-8
class ComunidadOrganizacion < ActiveRecord::Base
	belongs_to :organizacion, foreign_key: "id_organizacion", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
