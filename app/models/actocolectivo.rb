# encoding: UTF-8
class Actocolectivo < ActiveRecord::Base
  belongs_to :presponsable, foreign_key: "id_presponsable", validate: true
  belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
  belongs_to :caso, foreign_key: "id_caso", validate: true
  belongs_to :categoria, foreign_key: "id_categoria", validate: true
end
