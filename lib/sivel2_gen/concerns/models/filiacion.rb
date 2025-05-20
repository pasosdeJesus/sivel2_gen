# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Filiacion
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          self.table_name = "sivel2_gen_filiacion"

          has_and_belongs_to_many :victimacolectiva,
            foreign_key: "filiacion_id",
            class: "Sivel2Gen::Victimacolectiva",
            join_table: "sivel2_gen_filiacion_victimacolectiva"

          has_many :victima,
            foreign_key: "filiacion_id",
            class_name: "Sivel2Gen::Victima"

          has_many :combatiente,
            class_name: "Sivel2Gen::Combatiente",
            foreign_key: "profesion_id"
        end
      end
    end
  end
end
