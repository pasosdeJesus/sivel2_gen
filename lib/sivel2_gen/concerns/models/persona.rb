# encoding: UTF-8

require 'sip/concerns/models/persona'

module Sivel2Gen
  module Concerns
    module Models
      module Persona
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Persona

        included do

          has_many :acto, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Acto"
          has_many :antecedente_victima, foreign_key: "id_persona", 
            validate: true, class_name: "Sivel2Gen::AntecedenteVictima"
          has_many :victima, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :casos, :through => :victimas
        end

      end
    end
  end
end

