# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Antecedente
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          self.table_name = "sivel2_gen_antecedente"
          has_many :antecedente_caso, foreign_key: "id_antecedente", 
            class_name: 'Sivel2Gen::AntecedenteCaso'
          has_many :antecedente_victimacolectiva, 
            foreign_key: "id_antecedente", validate: true, 
            class_name: 'Sivel2Gen::AntecedenteVictimacolectiva'
          has_many :antecedente_victima, foreign_key: "id_antecedente", 
            validate: true, class_name: 'Sivel2Gen::AntecedenteVictima'
          has_many :antecedente_combatiente, 
            foreign_key: "id_antecedente", validate: true, 
            class_name: 'Sivel2Gen::AntecedenteCombatiente'
        end
      end
    end
  end
end


