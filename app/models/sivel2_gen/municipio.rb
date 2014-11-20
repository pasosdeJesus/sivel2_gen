# encoding: UTF-8
module Sivel2Gen
  class Municipio < ActiveRecord::Base
    include Basica

    has_many :clase, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sivel2Gen::Clase'
    has_many :persona, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sivel2Gen::Persona'
    has_many :ubicacion, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sivel2Gen::Ubicacion'
#    has_many :desplazamiento, foreign_key: "municipiodecl", validate: true, 
#      class_name: 'Sivel2Gen::Desplazamiento'
    has_many :victimasjr, foreign_key: "id_municipio", validate: true, 
      class_name: 'Sivel2Gen::Victimasjr'

    belongs_to :departamento, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sivel2Gen::Departamento'
    belongs_to :pais, foreign_key: "id_pais", validate: true, 
      class_name: 'Sivel2Gen::Pais'

    validates :id, presence: true  # Diseñados en el caso de SIVeL 
    validates :id_pais, presence: true
    validates :id_departamento, presence: true
    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
