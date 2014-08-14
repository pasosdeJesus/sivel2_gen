# encoding: UTF-8
class ComunidadSectorsocial < ActiveRecord::Base
	belongs_to :sectorsocial, foreign_key: "id_sectorsocial", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
