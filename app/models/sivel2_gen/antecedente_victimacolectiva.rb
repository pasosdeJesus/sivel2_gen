
module Sivel2Gen
  class AntecedenteVictimacolectiva < ActiveRecord::Base
    belongs_to :antecedente, foreign_key: "id_antecedente", validate: true, 
      class_name: 'Sivel2Gen::Antecedente'
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
  end
end
