# frozen_string_literal: true

require "msip/concerns/models/grupoper"

module Sivel2Gen
  module Concerns
    module Models
      module Grupoper
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Grupoper

        included do
          has_many :actocolectivo,
            foreign_key: "grupoper_id",
            validate: true,
            class_name: "Sivel2Gen::Actocolectivo"
          has_many :victimacolectiva,
            foreign_key: "grupoper_id",
            validate: true,
            class_name: "Sivel2Gen::Victimacolectiva"
          has_many :caso,
            through: :victimacolectiva,
            class_name: "Sivel2Gen::Caso"
        end
      end
    end
  end
end
