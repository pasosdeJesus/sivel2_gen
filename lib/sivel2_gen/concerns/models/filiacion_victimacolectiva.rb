
module Sivel2Gen
  module Concerns
    module Models
      module FiliacionVictimacolectiva
        extend ActiveSupport::Concern

        included do

          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :filiacion, foreign_key: "id_filiacion", 
            class_name: 'Sivel2Gen::Filiacion', optional: false
          belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
            class_name: 'Sivel2Gen::Victimacolectiva', optional: false
        end # included

      end
    end
  end
end
