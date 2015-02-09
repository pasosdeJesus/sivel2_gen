# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Ubicacion
        extend ActiveSupport::Concern

        included do
          has_one :salidarefugio, validate: true, foreign_key: "id_salida",
            class_name: "Sivel2Gen::Casosjr"
          has_one :llegadarefugio, foreign_key: "id_llegada", validate: true, 
            class_name: "Sivel2Gen::Casosjr"

          belongs_to :pais, foreign_key: "id_pais", validate: true, 
            class_name: "Sivel2Gen::Pais"
          belongs_to :departamento, foreign_key: "id_departamento", validate: true, 
            class_name: "Sivel2Gen::Departamento" 
          belongs_to :municipio, foreign_key: "id_municipio", validate: true, 
            class_name: "Sivel2Gen::Municipio"
          belongs_to :clase, foreign_key: "id_clase", validate: true, 
            class_name: "Sivel2Gen::Clase" 
          belongs_to :tsitio, foreign_key: "id_tsitio", validate: true, 
            class_name: "Sivel2Gen::Tsitio" 
          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true
            
          validates_presence_of :pais
          validates_presence_of :id_tsitio
          validates_presence_of :caso
        end
      end
    end
  end
end

