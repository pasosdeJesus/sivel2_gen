# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module AnexoCaso
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          self.table_name = "sivel2_gen_anexo_caso"

          belongs_to :caso,
            validate: true,
            class_name: "Sivel2Gen::Caso",
            inverse_of: :anexo_caso,
            optional: false
          belongs_to :fuenteprensa,
            class_name: "Msip::Fuenteprensa",
            optional: true
          belongs_to :fotra,
            class_name: "Sivel2Gen::Fotra",
            optional: true
          belongs_to :msip_anexo,
            foreign_key: "anexo_id",
            validate: true,
            class_name: "Msip::Anexo",
            optional: false # ,
          # inverse_of: :anexo_caso
          accepts_nested_attributes_for :msip_anexo, reject_if: :all_blank

          has_many :caso_fuenteprensa,
            foreign_key: "anexo_caso_id",
            dependent: :nullify,
            class_name: "Sivel2Gen::CasoFuenteprensa"

          has_many :caso_fotra,
            foreign_key: "anexo_caso_id",
            dependent: :nullify,
            class_name: "Sivel2Gen::CasoFotra"

          campofecha_localizado :fecha

          validates :caso, presence: true
          validates :msip_anexo, presence: true
          validates :fecha, presence: true
        end
      end
    end
  end
end
