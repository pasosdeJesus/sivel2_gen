
module Sivel2Gen
  class AntecedenteVictimacolectiva < ActiveRecord::Base
    belongs_to :antecedente, foreign_key: "antecedente_id", validate: true, 
      class_name: 'Sivel2Gen::Antecedente', optional: false
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva', 
      optional: false
  end
end
