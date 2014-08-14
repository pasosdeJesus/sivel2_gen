# encoding: UTF-8
class CasoFfrecuente < ActiveRecord::Base
	has_many :anexo, foreign_key: "id_caso,id_ffrecuente,fechaffrecuente", validate: true
	belongs_to :ffrecuente, foreign_key: "id_ffrecuente", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
