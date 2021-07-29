# encoding: UTF-8

require 'sip/concerns/models/persona'

module Sivel2Gen
  module Concerns
    module Models
      module Persona
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Models::Persona
          attr_accessor :sin_identificacion

          has_many :acto, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Acto"
          has_many :victima, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :caso, :through => :victima,
            class_name: 'Sivel2Gen::Caso'

          def sivel2_gen_presenta(atr)
            sip_presenta(atr)
          end

          def presenta(atr)
            sivel2_gen_presenta(atr)
          end

          def sin_identificacion
            if nombres == "N" && apellidos == "N"
              caso = Sivel2Gen::Victima.where(id_persona: self.id)[0].id_caso
              vics = Sivel2Gen::Victima.where(id_caso: caso)
              hv = {}
              vics.each_with_index do |vi, index|
                if vi.persona.nombres == 'N' && vi.persona.apellidos == 'N'
                  hv[vi.id] = index
                end
              end
              return "PERSONA SIN IDENTIFICAR #{hv[Sivel2Gen::Victima.where(id_persona: self.id)[0].id]}"
            else
              "PERSONA IDENTIFICADA"
            end
          end
        end

      end
    end
  end
end

