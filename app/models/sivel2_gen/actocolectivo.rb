# encoding: UTF-8
module Sivel2Gen
  class Actocolectivo < ActiveRecord::Base
    belongs_to :presponsable, foreign_key: "id_presponsable", 
      validate: true, class_name: 'Sivel2Gen::Presponsable'
    belongs_to :grupoper, foreign_key: "id_grupoper", 
      validate: true, class_name: 'Sip::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
    belongs_to :categoria, foreign_key: "id_categoria", 
      validate: true, class_name: 'Sivel2Gen::Categoria'
  end
end
