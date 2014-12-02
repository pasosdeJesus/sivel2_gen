# encoding: UTF-8
module Sivel2Gen
  class Tviolencia < ActiveRecord::Base
    include Basica

    has_many :supracategoria, foreign_key: "id_tviolencia", validate: true, 
      class_name: 'Sivel2Gen::Supracategoria'
    has_many :categoria, foreign_key: "id_tviolencia", validate: true, 
      class_name: 'Sivel2Gen::Categoria'
  end
end
