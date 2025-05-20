# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Antecedente
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          self.table_name = "sivel2_gen_antecedente"
          has_many :antecedente_caso,
            foreign_key: "antecedente_id",
            class_name: "Sivel2Gen::AntecedenteCaso"
          has_many :antecedente_victimacolectiva,
            foreign_key: "antecedente_id",
            class_name: "Sivel2Gen::AntecedenteVictimacolectiva"
          has_many :antecedente_victima,
            foreign_key: "antecedente_id",
            class_name: "Sivel2Gen::AntecedenteVictima"
          has_many :antecedente_combatiente,
            foreign_key: "antecedente_id",
            validate: true,
            class_name: "Sivel2Gen::AntecedenteCombatiente"
        end
      end
    end
  end
end
