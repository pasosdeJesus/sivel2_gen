# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module OrganizacionVictimacolectiva
        extend ActiveSupport::Concern

        included do
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :organizacion,
            validate: true,
            class_name: "Sivel2Gen::Organizacion",
            optional: false
          belongs_to :victimacolectiva,
            validate: true,
            class_name: "Sivel2Gen::Victimacolectiva",
            optional: false
        end # included
      end
    end
  end
end
