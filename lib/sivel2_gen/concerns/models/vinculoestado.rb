# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Vinculoestado
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          has_many :victimacolectiva_vinculoestado,
            foreign_key: "vinculoestado_id",
            validate: true,
            class_name: "Sivel2Gen::VictimacolectivaVinculoestado"
          has_many :victima,
            foreign_key: "vinculoestado_id",
            class_name: "Sivel2Gen::Victima"
          has_many :combatiente,
            class_name: "Sivel2Gen::Combatiente",
            foreign_key: "vinculoestado_id"
        end
      end
    end
  end
end
