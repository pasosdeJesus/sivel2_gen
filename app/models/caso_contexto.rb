# encoding: UTF-8
class CasoContexto < ActiveRecord::Base
	belongs_to :caso, foreign_key: "id_caso", validate: true
	belongs_to :contexto, foreign_key: "id_contexto", validate: true
end
