# encoding: UTF-8
module Sivel2Gen
  class Departamento < ActiveRecord::Base
    include Basica

    self.primary_key = nil
    has_many :clase, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sivel2Gen::Clase'
    has_many :municipio, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sivel2Gen::Municipio'
    has_many :persona, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sivel2Gen::Persona'
    has_many :ubicacion, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sivel2Gen::Ubicacion'
#    has_many :desplazamiento, foreign_key: "departamentodecl", validate: true, 
#      class_name: 'Sivel2Gen::Desplazamiento'
    has_many :victimasjr, foreign_key: "id_departamento", validate: true, 
      class_name: 'Sivel2Gen::Victimasjr'

    belongs_to :pais, foreign_key: "id_pais", validate: true, 
      class_name: 'Sivel2Gen::Pais'

    validates :id, presence: true  # Diseñados en el caso de SIVeL
    validates :id_pais, presence: true
  end
end
