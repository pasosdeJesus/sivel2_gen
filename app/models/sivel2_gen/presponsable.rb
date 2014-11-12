# encoding: UTF-8
module Sivel2Gen
  class Presponsable < ActiveRecord::Base
    include Basica

    has_many :acto, foreign_key: "id_presponsable", validate: true, 
      class_name: 'Sivel2Gen::Acto'
    has_many :actocolectivo, foreign_key: "id_presponsable", 
      validate: true, class_name: 'Sivel2Gen::Actocolectivo'
    has_many :caso_categoria_presponsable, foreign_key: "id_presponsable", 
      validate: true, class_name: 'Sivel2Gen::CasoCategoriaPresponsable'
    has_many :caso_presponsable, foreign_key: "id_presponsable", 
      validate: true, class_name: 'Sivel2Gen::CasoPresponsable'
    has_many :caso, through: :caso_presponsable, 
      class_name: 'Sivel2Gen::Caso'
    has_many :presponsable, foreign_key: "papa", validate: true, 
      class_name: 'Sivel2Gen::Presponsable'
    has_many :victima, foreign_key: "organizacionarmada", validate: true, 
      class_name: 'Sivel2Gen::Victima'
    has_many :victimacolectiva, foreign_key: "organizacionarmada", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
    has_many :actosjr, foreign_key: "id_presponsable", validate: true, 
      class_name: 'Sivel2Gen::Actosjr'

    belongs_to :presponsable, foreign_key: "papa", validate: true, 
      class_name: 'Sivel2Gen::Presponsable'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
