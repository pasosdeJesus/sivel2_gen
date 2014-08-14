# encoding: UTF-8
class Tproceso < ActiveRecord::Base
	has_many :proceso, foreign_key: "id_tproceso", validate: true
	has_many :etapa, foreign_key: "id_tproceso", validate: true
	has_many :despacho, foreign_key: "id_tproceso", validate: true
end
