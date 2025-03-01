# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module CasoFuenteprensa
        extend ActiveSupport::Concern

        included do
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :caso,
            class_name: "Sivel2Gen::Caso",
            validate: true,
            optional: false
          belongs_to :fuenteprensa,
            class_name: "Msip::Fuenteprensa",
            validate: true,
            optional: false
          belongs_to :anexo_caso,
            class_name: "Sivel2Gen::AnexoCaso",
            dependent: :destroy,
            optional: true

          campofecha_localizado :fecha
          validates_presence_of :fecha
          validates_presence_of :caso
          validates_presence_of :fuenteprensa
          validates :ubicacion, length: { maximum: 1024 }
          validates :clasificacion, length: { maximum: 100 }
          validates :ubicacionfisica, length: { maximum: 1024 }

          validates :fuenteprensa_id, uniqueness: {
            scope: [
              :caso_id, :fecha,
            ],
          }

          def saltar_fuente_tras_caso?
            false
          end
        end
      end
    end
  end
end
