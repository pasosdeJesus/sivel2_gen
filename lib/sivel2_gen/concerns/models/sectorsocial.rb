# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Sectorsocial
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_many :sectorsocial_victimacolectiva,
            foreign_key: "sectorsocial_id",
            validate: true,
            class_name: "Sivel2Gen::SectorsocialVictimacolectiva"
          has_many :victima,
            foreign_key: "sectorsocial_id",
            validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :combatiente,
            class_name: "Sivel2Gen::Combatiente",
            foreign_key: "sectorsocial_id"
        end
      end
    end
  end
end
