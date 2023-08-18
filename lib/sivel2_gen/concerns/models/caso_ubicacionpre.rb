
require 'msip/accesores_ubicacionpre'

module Sivel2Gen
  module Concerns
    module Models
      module CasoUbicacionpre
        extend ActiveSupport::Concern

        included do
          include Msip::Localizacion

          extend Msip::AccesoresUbicacionpre

          accesores_ubicacionpre :ubicacionpre

          belongs_to :caso, 
            class_name: "Sivel2Gen::Caso",
            foreign_key: "caso_id",
            validate: false,
            inverse_of: :caso_ubicacionpre,
            optional: false
          belongs_to :ubicacionpre, 
            class_name: 'Msip::Ubicacionpre', 
            foreign_key: "ubicacionpre_id", 
            validate: false, 
            optional: false

        end # included

      end
    end
  end
end
