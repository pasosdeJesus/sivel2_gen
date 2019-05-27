# encoding: UTF-8

module Sivel2Gen
  class CasoCategoriaPresponsable < ActiveRecord::Base
    belongs_to :categoria, foreign_key: "id_categoria", validate: true, 
      class_name: 'Sivel2Gen::Categoria'
    belongs_to :caso_presponsable, foreign_key: "id_caso_presponsable", 
      validate: true, class_name: 'Sivel2Gen::CasoPresponsable'
  end
end
