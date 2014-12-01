# encoding: UTF-8
module Sivel2Gen
  class ComunidadSectorsocial < ActiveRecord::Base
    belongs_to :sectorsocial, foreign_key: "id_sectorsocial", 
      validate: true, class_name: 'Sivel2Gen::Sectorsocial'
    belongs_to :grupoper, foreign_key: "id_grupoper", validate: true, 
      class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
