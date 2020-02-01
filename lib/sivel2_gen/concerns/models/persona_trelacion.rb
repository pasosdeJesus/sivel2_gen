# encoding: UTF-8

require 'sip/concerns/models/persona_trelacion'

module Sivel2Gen
  module Concerns
    module Models
      module PersonaTrelacion
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Models::PersonaTrelacion

          has_and_belongs_to_many :victima, foreign_key: "persona1", validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :casos, :through => :victimas

        end
      end
    end
  end
end

