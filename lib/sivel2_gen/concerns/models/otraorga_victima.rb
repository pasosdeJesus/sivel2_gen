# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module OtraorgaVictima
        extend ActiveSupport::Concern
        included do
          belongs_to :organizacion,
            validate: true,
            class_name: "Sivel2Gen::Organizacion",
            optional: false
          belongs_to :victima,
            validate: true,
            class_name: "Sivel2Gen::Victima",
            optional: false
        end
      end
    end
  end
end
