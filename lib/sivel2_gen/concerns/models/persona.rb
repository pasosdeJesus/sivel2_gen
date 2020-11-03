# encoding: UTF-8

require 'sip/concerns/models/persona'

module Sivel2Gen
  module Concerns
    module Models
      module Persona
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Models::Persona

          has_many :acto, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Acto"
          has_many :victima, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :caso, :through => :victima,
            class_name: 'Sivel2Gen::Caso'
          has_many :lugarpreliminar, foreign_key: "id_persona", validate: true,
            class_name: 'Sivel2Gen::Lugarpreliminar'

          def sivel2_gen_presenta(atr)
            sip_presenta(atr)
          end

          def presenta(atr)
            sivel2_gen_presenta(atr)
          end

        end

      end
    end
  end
end

