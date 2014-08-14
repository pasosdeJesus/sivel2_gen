# encoding: UTF-8
class Clase < ActiveRecord::Base
	has_many :persona, foreign_key: "id_clase", validate: true
	has_many :ubicacion, foreign_key: "id_clase", validate: true
	belongs_to :pais, foreign_key: "id_pais", validate: true
	belongs_to :departamento, foreign_key: "id_departamento", validate: true
	belongs_to :municipio, foreign_key: "id_municipio", validate: true
	belongs_to :tclase, foreign_key: "id_tclase", validate: true

  validates_presence_of :id  # Diseñados en el caso de SIVeL 
  validates_presence_of :id_pais
  validates_presence_of :id_departamento
  validates_presence_of :id_municipio
  validates_presence_of :nombre
  validates_presence_of :fechacreacion

end
