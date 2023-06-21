
#require 'msip/accesores_ubicacionpre'

module Sivel2Gen
  module Concerns
    module Models
      module CasoUbicacionpre
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo
          include Msip::Localizacion

#          extend Msip::AccesoresUbicacionpre

#          accesores_ubicacionpre :ubicacionpre

          #self.table_name = 'sivel2_gen_caso_ubicacionpre'

          belongs_to :caso, foreign_key: "caso_id", validate: false, 
            class_name: 'Sivel2Gen::Caso', inverse_of: :caso_ubicacionpre, 
            optional: false
          belongs_to :ubicacionpre, foreign_key: "ubicacionpre_id", 
            validate: false, class_name: 'Msip::Ubicacionpre', optional: false

          validates_presence_of :ubicacionpre_id
          validates_presence_of :caso_id

        end # included

      end
    end
  end
end
