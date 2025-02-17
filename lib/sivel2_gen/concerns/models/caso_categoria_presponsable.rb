# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module CasoCategoriaPresponsable
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :categoria,
            validate: true,
            class_name: "Sivel2Gen::Categoria",
            optional: false,
            inverse_of: :caso_categoria_presponsable
          belongs_to :caso_presponsable,
            validate: true,
            class_name: "Sivel2Gen::CasoPresponsable",
            optional: false,
            inverse_of: :caso_categoria_presponsable
        end # included
      end
    end
  end
end
