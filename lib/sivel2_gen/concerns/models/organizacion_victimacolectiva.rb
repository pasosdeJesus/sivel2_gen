
module Sivel2Gen
  module Concerns
    module Models
      module OrganizacionVictimacolectiva
        extend ActiveSupport::Concern

        included do

          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :organizacion, foreign_key: "id_organizacion", 
            validate: true, class_name: 'Sivel2Gen::Organizacion', 
            optional: false
          belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
            validate: true, class_name: 'Sivel2Gen::Victimacolectiva', 
            optional: false

        end # included

      end
    end
  end
end

