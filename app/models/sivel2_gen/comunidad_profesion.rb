# encoding: UTF-8
module Sivel2Gen
  class ComunidadProfesion < ActiveRecord::Base
    belongs_to :profesion, foreign_key: "id_profesion", validate: true, 
      class_name: 'Sivel2Gen::Profesion'
    belongs_to :grupoper, foreign_key: "id_grupoper", validate: true, 
      class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
