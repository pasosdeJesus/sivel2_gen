
require 'msip/concerns/models/persona'

module Sivel2Gen
  module Concerns
    module Models
      module Persona
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Models::Persona
          attr_accessor :sin_identificacion

          has_many :acto, foreign_key: "persona_id", validate: true,
            class_name: "Sivel2Gen::Acto"
          has_many :victima, foreign_key: "persona_id", validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :caso, :through => :victima,
            class_name: 'Sivel2Gen::Caso'

          def sivel2_gen_presenta(atr)
            msip_presenta(atr)
          end

          def presenta(atr)
            sivel2_gen_presenta(atr)
          end

          def sin_identificacion
            if nombres == "N" && apellidos == "N"
              caso = Sivel2Gen::Victima.where(persona_id: self.id)[0].caso_id
              vics = Sivel2Gen::Victima.where(caso_id: caso)
              hv = {}
              ban = 1
              vics.each_with_index do |vi, index|
                if vi.persona.nombres == 'N' && vi.persona.apellidos == 'N'
                  hv[vi.id] = ban
                  ban += 1
                end
              end
              return "PERSONA SIN IDENTIFICAR #{hv[Sivel2Gen::Victima.where(persona_id: self.id)[0].id]}"
            else
              "PERSONA IDENTIFICADA"
            end
          end
        end

      end
    end
  end
end

