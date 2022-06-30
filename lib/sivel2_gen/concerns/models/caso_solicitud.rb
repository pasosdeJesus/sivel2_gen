module Sivel2Gen
  module Concerns
    module Models
      module CasoSolicitud
        extend ActiveSupport::Concern

        included do
          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          self.table_name = 'sivel2_gen_caso_solicitud'
          belongs_to :caso, 
            class_name: 'Sivel2Gen::Caso',
            validate: true, foreign_key: 'caso_id', optional: false
          belongs_to :solicitud, class_name: 'Sip::Solicitud', validate: true,
            foreign_key: 'solicitud_id', optional: false
          accepts_nested_attributes_for :solicitud, reject_if: :all_blank


        end # included

      end
    end
  end
end
