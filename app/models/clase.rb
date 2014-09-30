# encoding: UTF-8
class Clase < ActiveRecord::Base
  extend Basica

	has_many :persona, foreign_key: "id_clase", validate: true
	has_many :ubicacion, foreign_key: "id_clase", validate: true

	belongs_to :pais, foreign_key: "id_pais", validate: true
	belongs_to :departamento, foreign_key: "id_departamento", validate: true
	belongs_to :municipio, foreign_key: "id_municipio", validate: true
	belongs_to :tclase, foreign_key: "id_tclase", validate: true

  validates :id, presence: true  # Diseñados en el caso de SIVeL 
  validates :id_pais, presence: true
  validates :id_departamento, presence:true
  validates :id_municipio, presence:true
  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
