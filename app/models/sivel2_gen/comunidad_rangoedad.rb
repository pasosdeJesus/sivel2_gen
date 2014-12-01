# encoding: UTF-8
module Sivel2Gen
  class ComunidadRangoedad < ActiveRecord::Base
    belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true, 
      class_name: 'Sivel2Gen::Rangoedad'
    belongs_to :grupoper, foreign_key: "id_grupoper", validate: true, 
      class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
