# encoding: UTF-8
class ComunidadRangoedad < ActiveRecord::Base
	belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
