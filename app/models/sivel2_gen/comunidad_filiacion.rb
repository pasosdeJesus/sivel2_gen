# encoding: UTF-8
module Sivel2Gen
  class ComunidadFiliacion < ActiveRecord::Base
    belongs_to :filiacion, foreign_key: "id_filiacion", 
      validate: true, class_name: 'Sivel2Gen::Filiacion'
    belongs_to :grupoper, foreign_key: "id_grupoper", 
      validate: true, class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
