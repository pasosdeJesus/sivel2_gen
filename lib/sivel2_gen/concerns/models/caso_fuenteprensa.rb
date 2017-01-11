# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module CasoFuenteprensa
        extend ActiveSupport::Concern

        included do
          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true
          belongs_to :fuenteprensa, class_name: "Sip::Fuenteprensa", 
            foreign_key: "fuenteprensa_id", validate: true
          belongs_to :anexo_caso, class_name: "Sivel2Gen::AnexoCaso", 
            foreign_key: "anexo_caso_id"
            
          validates_presence_of :fecha
          validates_presence_of :caso
          validates_presence_of :fuenteprensa
          validates :ubicacion, length: { maximum: 100 } 
          validates :clasificacion, length: { maximum: 100 } 
          validates :ubicacionfisica, length: { maximum: 100 } 

          validates :fecha, uniqueness: { scope: [
            :ubicacion, :clasificacion, :ubicacionfisica, :fuenteprensa_id
          ] }

          def saltar_fuente_tras_caso?
            false
          end

          validate :fuente_tras_caso
          def fuente_tras_caso
            errors.add(:fecha, 
                       'Fecha de fuente no puede ser anterior a la del caso') if
              !saltar_fuente_tras_caso? && caso && fecha && fecha < caso.fecha
          end

        end
      end
    end
  end
end

