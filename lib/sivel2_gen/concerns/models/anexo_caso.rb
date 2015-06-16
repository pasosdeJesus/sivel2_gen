# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module AnexoCaso
        extend ActiveSupport::Concern

        included do
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso", inverse_of: :anexo_caso
          belongs_to :sip_anexo, foreign_key: "id_anexo", validate: true, 
            class_name: "Sip::Anexo"
          accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank

          validates :caso, presence: true
          validates :sip_anexo, presence: true
          validates :fecha, presence: true
        end

      end
    end
  end
end

