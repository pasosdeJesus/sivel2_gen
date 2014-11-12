# encoding: UTF-8
module Sivel2Gen
  class Acto < ActiveRecord::Base
    belongs_to :presponsable, foreign_key: "id_presponsable", validate: true, 
      class_name: 'Sivel2Gen::Presponsable'
    accepts_nested_attributes_for :presponsable
    belongs_to :persona, foreign_key: "id_persona", validate: true, 
      class_name: 'Sivel2Gen::Persona'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
    belongs_to :categoria, foreign_key: "id_categoria", validate: true, 
      class_name: 'Sivel2Gen::Categoria'

    validates_presence_of :presponsable
    validates_presence_of :persona
    validates_presence_of :caso
    validates_presence_of :categoria
  end
end
