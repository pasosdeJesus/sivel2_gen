# encoding: UTF-8
class CasoFrontera < ActiveRecord::Base
	belongs_to :frontera, foreign_key: "id_frontera", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
