# encoding: UTF-8
class Acto < ActiveRecord::Base
  has_many :actosjr, foreign_key: "id_presponsable,id_persona,id_caso,id_categoria", validate: true
  belongs_to :presponsable, foreign_key: "id_presponsable", validate: true
  belongs_to :persona, foreign_key: "id_persona", validate: true
  belongs_to :caso, foreign_key: "id_caso", validate: true
  belongs_to :categoria, foreign_key: "id_categoria", validate: true
end
