# encoding: UTF-8
class Etapa < ActiveRecord::Base
	has_many :proceso, foreign_key: "id_etapa", validate: true
	belongs_to :tproceso, foreign_key: "id_tproceso", validate: true
end
