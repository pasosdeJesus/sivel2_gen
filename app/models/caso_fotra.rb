# encoding: UTF-8
class CasoFotra < ActiveRecord::Base
	belongs_to :caso, foreign_key: "id_caso", validate: true
	belongs_to :fotra, foreign_key: "id_fotra", validate: true
end
