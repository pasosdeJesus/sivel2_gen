# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module AnexoCaso
        extend ActiveSupport::Concern

        included do
          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso", inverse_of: :anexo_caso
          belongs_to :sip_anexo, foreign_key: "id_anexo", validate: true, 
            class_name: "Sip::Anexo"
          accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank

          has_many :caso_fuenteprensa, foreign_key: "anexo_caso_id",
            class_name: "Sivel2Gen::CasoFuenteprensa"

          has_many :caso_fotra, foreign_key: "anexo_caso_id", 
            dependent: :destroy, class_name: "Sivel2Gen::CasoFotra"

          campofecha_localizado :fecha

          validates :caso, presence: true
          validates :sip_anexo, presence: true
          validates :fecha, presence: true
        end

      end
    end
  end
end

