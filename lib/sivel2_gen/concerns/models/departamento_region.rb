# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module DepartamentoRegion
        extend ActiveSupport::Concern

        included do
          belongs_to :region,
            class_name: "Sivel2Gen::Region",
            optional: false
          belongs_to :departamento,
            class_name: "Msip::Departamento",
            optional: false
        end
      end
    end
  end
end
