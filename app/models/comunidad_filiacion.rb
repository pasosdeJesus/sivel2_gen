# encoding: UTF-8
class ComunidadFiliacion < ActiveRecord::Base
	belongs_to :filiacion, foreign_key: "id_filiacion", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
