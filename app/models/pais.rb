# encoding: UTF-8
class Pais < ActiveRecord::Base
  include Basica

	has_many :clase, foreign_key: "id_pais", validate: true
	has_many :municipio, foreign_key: "id_pais", validate: true
	has_many :departamento, foreign_key: "id_pais", validate: true
	has_one :personanacionalde, class_name: "Persona", 
    foreign_key: "nacionalde", validate: true
	has_many :persona, foreign_key: "id_pais", validate: true
	has_many :ubicacion, foreign_key: "id_pais", validate: true
	has_many :desplazamiento, foreign_key: "paisdecl", validate: true
	has_many :victimasjr, foreign_key: "id_pais", validate: true

  validates :id, presence: true  # Diseñados en caso de SIVeL 
  validates :nombreiso, presence: true, allow_blank: false
  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
