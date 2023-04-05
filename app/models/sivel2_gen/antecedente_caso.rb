
module Sivel2Gen
  class AntecedenteCaso < ActiveRecord::Base
    belongs_to :antecedente, foreign_key: "antecedente_id", 
      class_name: 'Sivel2Gen::Antecedente', optional: false
    belongs_to :caso, foreign_key: "caso_id", 
      class_name: 'Sivel2Gen::Caso', optional: false
  end
end
