
module Sivel2Gen
  module Concerns
    module Models
      module CasoCategoriaPresponsable
        extend ActiveSupport::Concern

        included do

          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :categoria, foreign_key: "id_categoria", validate: true, 
            class_name: 'Sivel2Gen::Categoria', optional: false
          belongs_to :caso_presponsable, foreign_key: "id_caso_presponsable", 
            validate: true, class_name: 'Sivel2Gen::CasoPresponsable', 
            optional: false

        end # included

      end
    end
  end
end
