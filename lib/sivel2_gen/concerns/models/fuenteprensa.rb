# frozen_string_literal: true

require "msip/concerns/models/fuenteprensa"

module Sivel2Gen
  module Concerns
    module Models
      module Fuenteprensa
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Fuenteprensa

        included do
          has_many :caso_fuenteprensa,
            foreign_key: "fuenteprensa_id",
            validate: true,
            dependent: :destroy,
            class_name: "Sivel2Gen::CasoFuenteprensa"
          has_many :anexocaso,
            foreign_key: "fuenteprensa_id",
            validate: true,
            class_name: "Sivel2Gen::AnexoCaso"
        end
      end
    end
  end
end
