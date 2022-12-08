
module Sivel2Gen
  module Concerns
    module Models
      module CasoFotra
        extend ActiveSupport::Concern

        included do
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true, optional: false
          belongs_to :anexo_caso, class_name: "Sivel2Gen::AnexoCaso", 
            dependent: :destroy, foreign_key: "anexo_caso_id", optional: true
          

          campofecha_localizado :fecha

          validates :fecha, presence: true
          validates :caso, presence: true
          validates :nombre, presence: true
          validates :nombre, length: { maximum: 500 } 
          validates :anotacion, length: { maximum: 1024 } 
          validates :ubicacionfisica, length: { maximum: 1024 } 
          validates :tfuente, length: { maximum: 25 } 
          validates :nombre, uniqueness: { scope: [ :fecha, :id_caso ] }

        end
      end
    end
  end
end

