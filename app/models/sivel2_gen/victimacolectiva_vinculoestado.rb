# encoding: UTF-8
module Sivel2Gen
  class VictimacolectivaVinculoestado < ActiveRecord::Base
    belongs_to :vinculoestado, foreign_key: "id_vinculoestado", validate: true, 
      class_name: 'Sivel2Gen::Vinculoestado'
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
  end
end
