# encoding: UTF-8
module Sivel2Gen
  class Pais < ActiveRecord::Base
    include Basica

    has_many :clase, foreign_key: "id_pais", validate: true,
      class_name: 'Sivel2Gen::Clase' 
    has_many :municipio, foreign_key: "id_pais", validate: true,
      class_name: 'Sivel2Gen::Municipio' 
    has_many :departamento, foreign_key: "id_pais", validate: true,
      class_name: 'Sivel2Gen::Departamento' 
    has_one :personanacionalde, foreign_key: "nacionalde", validate: true,
        class_name: "Sivel2Gen::Persona"
    has_many :persona, foreign_key: "id_pais", validate: true,
      class_name: 'Sivel2Gen::Victima' 
    has_many :ubicacion, foreign_key: "id_pais", validate: true,
      class_name: 'Sivel2Gen::Ubicacion' 
    has_many :desplazamiento, foreign_key: "paisdecl", validate: true,
      class_name: 'Sivel2Gen::Desplazamiento' 
    has_many :victimasjr, foreign_key: "id_pais", validate: true,
      class_name: 'Sivel2Gen::Victimasjr' 


    validates :id, presence: true  # Diseñados en caso de SIVeL 
    validates :nombreiso, presence: true, allow_blank: false
    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
