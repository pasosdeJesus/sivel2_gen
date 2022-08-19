
module Sivel2Gen
  module Concerns
    module Models
      module CasoEtiqueta
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          self.table_name = 'sivel2_gen_caso_etiqueta'

          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: 'Sivel2Gen::Caso', inverse_of: :caso_etiqueta, 
            optional: false
          belongs_to :etiqueta, foreign_key: "id_etiqueta", validate: true,
            class_name: 'Sip::Etiqueta', optional: false
          belongs_to :usuario, foreign_key: "id_usuario", validate: true, 
            optional: false

          campofecha_localizado :fecha

          validates_presence_of :fecha
          validates_presence_of :id_etiqueta

        end # included

      end
    end
  end
end
