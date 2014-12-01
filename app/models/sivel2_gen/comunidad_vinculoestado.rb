# encoding: UTF-8
module Sivel2Gen
  class ComunidadVinculoestado < ActiveRecord::Base
    belongs_to :vinculoestado, foreign_key: "id_vinculoestado", validate: true, 
      class_name: 'Sivel2Gen::Vinculoestado'
    belongs_to :grupoper, foreign_key: "id_grupoper", validate: true, 
      class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
