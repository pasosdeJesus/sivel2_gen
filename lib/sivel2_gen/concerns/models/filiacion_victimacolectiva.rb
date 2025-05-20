# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module FiliacionVictimacolectiva
        extend ActiveSupport::Concern

        included do
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :filiacion,
            class_name: "Sivel2Gen::Filiacion",
            optional: false
          belongs_to :victimacolectiva,
            class_name: "Sivel2Gen::Victimacolectiva",
            optional: false
        end # included
      end
    end
  end
end
