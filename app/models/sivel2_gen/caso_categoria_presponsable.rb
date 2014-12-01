# encoding: UTF-8
module Sivel2Gen
  class CasoCategoriaPresponsable < ActiveRecord::Base
    belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true, 
      class_name: 'Sivel2Gen::Tviolencia'
    belongs_to :categoria, foreign_key: "id_categoria", validate: true, 
      class_name: 'Sivel2Gen::Categoria'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
    belongs_to :presponsable, foreign_key: "id_presponsable", validate: true, 
      class_name: 'Sivel2Gen::Presponsable'
    belongs_to :supracategoria, foreign_key: "id_supracategoria", 
      validate: true, class_name: 'Sivel2Gen::Supracategoria'
  end
end
