# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module EtniaVictimacolectiva
        extend ActiveSupport::Concern

        included do
          belongs_to :etnia,
            validate: true,
            class_name: "Msip::Etnia",
            optional: false

          belongs_to :victimacolectiva,
            validate: true,
            class_name: "Sivel2Gen::Victimacolectiva",
            optional: false
        end
      end
    end
  end
end
