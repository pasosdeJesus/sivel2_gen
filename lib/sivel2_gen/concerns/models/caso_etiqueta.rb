
module Sivel2Gen
  module Concerns
    module Models
      module CasoEtiqueta
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          self.table_name = 'sivel2_gen_caso_etiqueta'

          belongs_to :caso, foreign_key: "caso_id", validate: false, 
            class_name: 'Sivel2Gen::Caso', inverse_of: :caso_etiqueta, 
            optional: false
          belongs_to :etiqueta, foreign_key: "etiqueta_id", validate: false,
            class_name: 'Msip::Etiqueta', optional: false
          belongs_to :usuario, foreign_key: "usuario_id", validate: false, 
            optional: false

          campofecha_localizado :fecha

          validates_presence_of :fecha
          validates_presence_of :etiqueta_id

        end # included

      end
    end
  end
end
