# encoding: UTF-8
class Municipio < ActiveRecord::Base
  include Basica

	has_many :clase, foreign_key: "id_municipio", validate: true
	has_many :persona, foreign_key: "id_municipio", validate: true
	has_many :ubicacion, foreign_key: "id_municipio", validate: true
	has_many :ubicacion, foreign_key: "id_municipio,id_departamento", validate: true
	has_many :desplazamiento, foreign_key: "municipiodecl", validate: true
	has_many :victimasjr, foreign_key: "id_municipio", validate: true
	belongs_to :departamento, foreign_key: "id_departamento", validate: true
	belongs_to :pais, foreign_key: "id_pais", validate: true

  validates :id, presence: true  # Diseñados en el caso de SIVeL 
  validates :id_pais, presence: true
  validates :id_departamento, presence: true
  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
