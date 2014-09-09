# encoding: UTF-8
class Departamento < ActiveRecord::Base
	has_many :clase, foreign_key: "id_departamento", validate: true
	has_many :municipio, foreign_key: "id_departamento", validate: true
	has_many :persona, foreign_key: "id_departamento", validate: true
	has_many :ubicacion, foreign_key: "id_departamento", validate: true
	has_many :desplazamiento, foreign_key: "departamentodecl", validate: true
	has_many :victimasjr, foreign_key: "id_departamento", validate: true

	belongs_to :pais, foreign_key: "id_pais", validate: true

  validates_presence_of :id  # Diseñados en el caso de SIVeL
  validates_presence_of :id_pais
  validates_presence_of :nombre
  validates_presence_of :fechacreacion
end
