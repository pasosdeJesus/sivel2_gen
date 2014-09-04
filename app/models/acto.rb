# encoding: UTF-8
class Acto < ActiveRecord::Base
  belongs_to :presponsable, foreign_key: "id_presponsable", validate: true
  accepts_nested_attributes_for :presponsable
  belongs_to :persona, foreign_key: "id_persona", validate: true
  belongs_to :caso, foreign_key: "id_caso", validate: true
  belongs_to :categoria, foreign_key: "id_categoria", validate: true

  validates_presence_of :presponsable
  validates_presence_of :persona
  validates_presence_of :caso
  validates_presence_of :categoria
end
