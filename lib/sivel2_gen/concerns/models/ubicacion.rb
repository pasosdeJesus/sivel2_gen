
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
            foreign_key: "id_caso", validate: true, optional: false

          validates :id_departamento, presence: { 
            message: "Ubicación del país debe tener departamento." 
          }, if: -> {id_pais == Sip.paisomision}

          attr_accessor :principal
          attr_accessor :tclase

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

          def tclase
            if self.clase && self.clase.tclase
              return self.clase.tclase.nombre 
            end
            return ''
          end

          def importa(datosent, datossal, menserror, opciones = {})
            pais = Sip::Pais.
              where('nombre ILIKE ?', datosent['pais']).ids[0]
            self.id_pais = pais || Sip.paisomision 
            dep = Sip::Departamento.
              where('nombre ILIKE ?', datosent['departamento']).
              where(id_pais: self.id_pais).ids[0]
            mun = Sip::Municipio.
              where('nombre ILIKE ?', datosent['municipio']).
              where(id_departamento: dep).ids[0]
            cen = Sip::Clase.
              where('nombre ILIKE ?', datosent['centro_poblado']).
              where(id_municipio: mun).ids[0]
            self.id_departamento= dep if dep
            self.id_municipio= mun if mun
            self.id_clase= cen if cen
            self.latitud= datosent['latitud'] if datosent['latitud']
            self.longitud= datosent['longitud'] if datosent['longitud']
            if datosent["observaciones"]
              datosent["observaciones"].each do |obs|
                ob = obs.split("_")
                case ob[0]
                  when "sitio"
                    self.sitio = ob[1]
                  when "lugar"
                    self.lugar = ob[1]
                  when "tsitio"
                    ts = Sip::Tsitio.where(nombre: ob[1])[0]
                    self.tsitio = ts if ts
                end
              end
            end 
            return self
          end

          validates_presence_of :caso
        end
      end
    end
  end
end

