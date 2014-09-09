# encoding: UTF-8
class Pais < ActiveRecord::Base
	has_many :clase, foreign_key: "id_pais", validate: true
	has_many :municipio, foreign_key: "id_pais", validate: true
	has_many :departamento, foreign_key: "id_pais", validate: true
	has_one :personanacionalde, class_name: "Persona", 
    foreign_key: "nacionalde", validate: true
	has_many :persona, foreign_key: "id_pais", validate: true
	has_many :ubicacion, foreign_key: "id_pais", validate: true
	has_many :desplazamiento, foreign_key: "paisdecl", validate: true
	has_many :victimasjr, foreign_key: "id_pais", validate: true

  validates_presence_of :id  # Diseñados en caso de SIVeL 
  validates_presence_of :nombre
  validates_presence_of :nombreiso
  validates_presence_of :fechacreacion
end
