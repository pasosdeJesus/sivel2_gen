# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Rangoedad
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_many :rangoedad_victimacolectiva,
            foreign_key: "rangoedad_id",
            validate: true,
            class_name: "Sivel2Gen::RangoedadVictimacolectiva"
          has_many :victima,
            foreign_key: "rangoedad_id",
            validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :combatiente,
            class_name: "Sivel2Gen::Combatiente",
            foreign_key: "rangoedad_id"

          validates :nombre, length: { maximum: 20 }
          validates :observaciones, length: { maximum: 5000 }
        end
      end
    end
  end
end
