# encoding: UTF-8
class Procesosjr < ActiveRecord::Base
	has_many :derecho_procesosjr, foreign_key: "id_proceso", validate: true, 
    dependent: :destroy
	belongs_to :proceso, foreign_key: "id_proceso", validate: true
	belongs_to :motivoconsulta, foreign_key: "id_motivoconsulta", validate: true
	belongs_to :mecanismoder, foreign_key: "id_mecanismoder", validate: true
	belongs_to :instanciader, foreign_key: "id_instanciader", validate: true
	belongs_to :mecanismoder, foreign_key: "otromecanismo", validate: true
	belongs_to :instanciader, foreign_key: "otrainstancia", validate: true
end
