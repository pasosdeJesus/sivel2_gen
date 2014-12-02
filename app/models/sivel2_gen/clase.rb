# encoding: UTF-8
module Sivel2Gen
  class Clase < ActiveRecord::Base
    include Basica

    has_many :persona, foreign_key: "id_clase", validate: true,
      class_name: 'Sivel2Gen::Persona'
    has_many :ubicacion, foreign_key: "id_clase", validate: true,
      class_name: 'Sivel2Gen::Ubicacion'

    belongs_to :pais, foreign_key: "id_pais", 
      validate: true, class_name: 'Sivel2Gen::Pais'
    belongs_to :departamento, foreign_key: "id_departamento", 
      validate: true, class_name: 'Sivel2Gen::Departamento'
    belongs_to :municipio, foreign_key: "id_municipio", 
      validate: true, class_name: 'Sivel2Gen::Municipio'
    belongs_to :tclase, foreign_key: "id_tclase", validate: true,
      class_name: 'Sivel2Gen::Tclase'

    validates :id, presence: true  # Diseñados en el caso de SIVeL 
    validates :id_pais, presence: true
    validates :id_departamento, presence:true
    validates :id_municipio, presence:true
  end
end
