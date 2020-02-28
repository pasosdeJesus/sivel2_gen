# encoding: UTF-8

require 'sip/concerns/models/ubicacion'

module Sivel2Gen
  module Concerns
    module Models
      module Ubicacion
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Ubicacion

        included do
          has_one :salidarefugio, validate: true, foreign_key: "id_salida",
            class_name: "Sivel2Gen::Casosjr"
          has_one :llegadarefugio, foreign_key: "id_llegada", validate: true, 
            class_name: "Sivel2Gen::Casosjr"
          has_many :principalde, foreign_key: "ubicacion_id", 
            validate: false, dependent: :nullify, 
            class_name: "Sivel2Gen::Caso"

          belongs_to :caso, class_name: "Sivel2Gen::Caso", 
            foreign_key: "id_caso", validate: true

          attr_accessor :principal

          def principal
            self.id && self.caso && (self.caso.ubicacion_id == self.id ||
                                     self.caso.ubicacion_id.nil?)
          end

          def principal=(v)
            if self.id && self.caso
              if v.to_i == 1
                self.caso.update_attribute('ubicacion_id', self.id)
              elsif self.caso.ubicacion_id == self.id
                self.caso.update_attribute('ubicacion_id', nil)
              end
            end
          end
          
          def importa(datosent, datossal, menserror, opciones = {})
            pais = Sip::Pais.where(nombre: datosent['pais']).ids[0]
            dep = Sip::Departamento.where(nombre: datosent['departamento']).ids[0]
            mun = Sip::Municipio.where(nombre: datosent['municipio']).ids[0]
            cen = Sip::Clase.where(nombre: datosent['centro_poblado']).ids[0]
            if pais
              self.id_pais = pais
            else
              self.id_pais = 170
            end
            self.id_departamento= dep if dep
            self.id_municipio= mun if mun
            self.id_clase= cen if cen
            self.latitud= datosent['latitud'] if datosent['latitud']
            self.longitud= datosent['longitud'] if datosent['longitud']
            return self
          end  
          
          validates_presence_of :caso
        end
      end
    end
  end
end

