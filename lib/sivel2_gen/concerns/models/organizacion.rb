# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Organizacion
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_and_belongs_to_many :victimacolectiva,
            class_name: "Sivel2Gen::Victimacolectiva",
            foreign_key: "organizacion_id",
            validate: true,
            join_table: "sivel2_gen_organizacion_victimacolectiva"

          has_many :victima,
            foreign_key: "organizacion_id",
            class_name: "Sivel2Gen::Victima"

          has_many :combatiente,
            class_name: "Sivel2Gen::Combatiente",
            foreign_key: "organizacion_id"
        end
      end
    end
  end
end
