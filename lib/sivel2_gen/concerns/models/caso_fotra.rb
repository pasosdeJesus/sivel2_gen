# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module CasoFotra
        extend ActiveSupport::Concern

        included do
          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true
          belongs_to :anexo_caso, class_name: "Sivel2Gen::AnexoCaso", 
            dependent: :destroy, foreign_key: "anexo_caso_id", optional: true
          

          campofecha_localizado :fecha

          validates :fecha, presence: true
          validates :caso, presence: true
          validates :nombre, presence: true
          validates :nombre, length: { maximum: 500 } 
          validates :anotacion, length: { maximum: 200 } 
          validates :ubicacionfisica, length: { maximum: 1024 } 
          validates :tfuente, length: { maximum: 25 } 
          validates :nombre, uniqueness: { scope: [ :fecha, :id_caso ] }


          validate :fuente_tras_caso
          def fuente_tras_caso
            errors.add(:fecha, 'En {%model} la fecha no puede ser anterior a la del caso') if
              caso && fecha && fecha < caso.fecha
          end

        end
      end
    end
  end
end

