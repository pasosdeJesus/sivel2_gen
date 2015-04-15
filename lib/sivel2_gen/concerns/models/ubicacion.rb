# encoding: UTF-8

require 'sip/concerns/models/ubicacion'

module Sivel2Gen
  module Concerns
    module Models
      module Ubicacion
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Ubicacion

        included do
          has_one :salidarefugio, validate: true, foreign_key: "id_salida",
            class_name: "Sivel2Gen::Casosjr"
          has_one :llegadarefugio, foreign_key: "id_llegada", validate: true, 
            class_name: "Sivel2Gen::Casosjr"

          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true
            
          validates_presence_of :caso
        end
      end
    end
  end
end

