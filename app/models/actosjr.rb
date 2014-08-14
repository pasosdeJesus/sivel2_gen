# encoding: UTF-8
class Actosjr < ActiveRecord::Base
  #nos gustaría: belongs_to :acto, foreign_key: "id_presponsable,id_persona,id_caso,id_categoria", validate: true
  belongs_to :desplazamiento, foreign_key: "fechaexpulsion"
  belongs_to :presponsable, foreign_key: "id_presponsable", validate: true
  belongs_to :persona, foreign_key: "id_persona", validate: true
  belongs_to :caso, foreign_key: "id_caso", validate: true
  belongs_to :categoria, foreign_key: "id_categoria", validate: true
end
