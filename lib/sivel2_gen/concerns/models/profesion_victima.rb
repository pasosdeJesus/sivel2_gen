# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module ProfesionVictima
        extend ActiveSupport::Concern
        included do
          belongs_to :profesion,
            validate: true,
            class_name: "Sivel2Gen::Profesion",
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
