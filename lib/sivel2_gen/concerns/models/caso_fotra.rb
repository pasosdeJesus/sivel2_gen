# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module CasoFotra
        extend ActiveSupport::Concern

        included do
          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true
          belongs_to :anexo_caso, class_name: "Sivel2Gen::AnexoCaso", 
            foreign_key: "anexo_caso_id"
            
          validates_presence_of :fecha
          validates_presence_of :caso
          validates_presence_of :nombre
          validates :nombre, length: { maximum: 500 } 
          validates :anotacion, length: { maximum: 200 } 
          validates :ubicacionfisica, length: { maximum: 100 } 
          validates :tfuente, length: { maximum: 25 } 

          validate :fuente_tras_caso
          def fuente_tras_caso
            errors.add(:fecha, 'No puede ser anterior a la del caso') if
              fecha < caso.fecha
          end

        end
      end
    end
  end
end

