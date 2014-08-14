# encoding: UTF-8
class Ubicacion < ActiveRecord::Base
	has_many :expulsion, class_name: "Desplazamiento", foreign_key: "id_expulsion", validate: true
	has_many :llegada, class_name: "Desplazamiento", foreign_key: "id_llegada", validate: true
	belongs_to :pais, foreign_key: "id_pais", validate: true
	belongs_to :departamento, foreign_key: "id_departamento", validate: true
	belongs_to :municipio, foreign_key: "id_municipio", validate: true
	belongs_to :clase, foreign_key: "id_clase", validate: true
	belongs_to :tsitio, foreign_key: "id_tsitio", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
	has_one :salidarefugio, class_name: "Casosjr", foreign_key: "id_salida", validate: true
	has_one :llegadarefugio, class_name: "Casosjr", foreign_key: "id_llegada", validate: true
  validates_presence_of :pais
end
