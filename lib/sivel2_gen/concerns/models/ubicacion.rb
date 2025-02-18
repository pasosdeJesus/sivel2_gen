# frozen_string_literal: true

require "msip/concerns/models/ubicacion"

module Sivel2Gen
  module Concerns
    module Models
      module Ubicacion
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Ubicacion

        included do
          has_many :principalde,
            foreign_key: "ubicacion_id",
            validate: false,
            dependent: :nullify,
            class_name: "Sivel2Gen::Caso"

          belongs_to :caso,
            class_name: "Sivel2Gen::Caso",
            validate: true,
            optional: false

          validates :departamento_id,
            presence: {
              message: "Ubicación del país debe tener departamento.",
            },
            if: -> { pais_id == Msip.paisomision }

          attr_accessor :principal
          attr_accessor :tcentropoblado

          def principal
            id && caso && (caso.ubicacion_id == id ||
                                     caso.ubicacion_id.nil?)
          end

          def principal=(v)
            if id && caso
              if v.to_i == 1
                caso.update_attribute("ubicacion_id", id)
              elsif caso.ubicacion_id == id
                caso.update_attribute("ubicacion_id", nil)
              end
            end
          end

          def tcentropoblado
            if centropoblado && centropoblado.tcentropoblado
              return centropoblado.tcentropoblado.nombre
            end

            ""
          end

          def importa(datosent, datossal, menserror, opciones = {})
            pais = Msip::Pais
              .where("nombre ILIKE ?", datosent["pais"]).ids[0]
            self.pais_id = pais || Msip.paisomision
            dep = Msip::Departamento
              .where("nombre ILIKE ?", datosent["departamento"])
              .where(pais_id: pais_id).ids[0]
            mun = Msip::Municipio
              .where("nombre ILIKE ?", datosent["municipio"])
              .where(departamento_id: dep).ids[0]
            cen = Msip::Centropoblado
              .where("nombre ILIKE ?", datosent["centro_poblado"])
              .where(municipio_id: mun).ids[0]
            self.departamento_id = dep if dep
            self.municipio_id = mun if mun
            self.centropoblado_id = cen if cen
            self.latitud = datosent["latitud"] if datosent["latitud"]
            self.longitud = datosent["longitud"] if datosent["longitud"]
            if datosent["observaciones"] &&
                datosent["observaciones"].class == "Array"
              datosent["observaciones"].each do |obs|
                ob = obs.split("_")
                case ob[0]
                when "sitio"
                  self.sitio = ob[1]
                when "lugar"
                  self.lugar = ob[1]
                when "tsitio"
                  ts = Msip::Tsitio.where(nombre: ob[1])[0]
                  self.tsitio = ts if ts
                end
              end
            end
            self
          end

          validates_presence_of :caso
        end
      end
    end
  end
end
