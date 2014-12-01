# encoding: UTF-8
module Sivel2Gen
  class ComunidadOrganizacion < ActiveRecord::Base
    belongs_to :organizacion, foreign_key: "id_organizacion", 
      validate: true, class_name: 'Sivel2Gen::Organizacion'
    belongs_to :grupoper, foreign_key: "id_grupoper", 
      validate: true, class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end

