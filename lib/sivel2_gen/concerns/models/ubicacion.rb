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

          attr_accessor :principal

          def principal
            self.id && self.caso && (self.caso.ubicacion_id == self.id ||
                                     self.caso.ubicacion_id.nil?)
          end

          def principal=(v)
            if self.id && self.caso
              if v.to_i == 1
                self.caso.update_attribute('ubicacion_id', self.id)
              elsif self.caso.ubicacion_id == self.id
                self.caso.update_attribute('ubicacion_id', nil)
              end
            end
          end

            
          validates_presence_of :caso
        end
      end
    end
  end
end

