# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module CasoEtiqueta
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          self.table_name = "sivel2_gen_caso_etiqueta"

          belongs_to :caso,
            validate: false,
            class_name: "Sivel2Gen::Caso",
            inverse_of: :caso_etiqueta,
            optional: false
          belongs_to :etiqueta,
            validate: false,
            class_name: "Msip::Etiqueta",
            optional: false
          belongs_to :usuario,
            validate: false,
            optional: false

          campofecha_localizado :fecha

          validates_presence_of :fecha
          validates_presence_of :etiqueta_id
        end # included
      end
    end
  end
end
