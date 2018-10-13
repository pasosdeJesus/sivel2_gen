# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Victima
        extend ActiveSupport::Concern

        include Sip::Modelo 
        include Sip::Localizacion

        included do

          attr_accessor :edad
          attr_accessor :edadactual

          has_many :antecedente_victima, foreign_key: :id_victima, 
            dependent: :delete_all,
            class_name: 'Sivel2Gen::AntecedenteVictima'
          has_many :antecedente, through: :antecedente_victima, 
            class_name: 'Sivel2Gen::Antecedente'

          # En el orden de esquema en base 
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso"
          belongs_to :etnia, foreign_key: "id_etnia", validate: true, 
            class_name: "Sivel2Gen::Etnia"
          belongs_to :filiacion, foreign_key: "id_filiacion", 
            validate: true, class_name: "Sivel2Gen::Filiacion"
          belongs_to :iglesia, foreign_key: "id_iglesia", validate: true, 
            class_name: "Sivel2Gen::Iglesia"
          belongs_to :organizacion, foreign_key: "id_organizacion", 
            validate: true, class_name: "Sivel2Gen::Organizacion"
          belongs_to :persona, foreign_key: "id_persona", validate: true, 
            class_name: "Sip::Persona"
          accepts_nested_attributes_for :persona, reject_if: :all_blank
          belongs_to :profesion, foreign_key: "id_profesion", validate: true, 
            class_name: "Sivel2Gen::Profesion"
          belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true, 
            class_name: "Sivel2Gen::Rangoedad"
          belongs_to :sectorsocial, foreign_key: "id_sectorsocial", 
            validate: true, class_name: "Sivel2Gen::Sectorsocial"
          belongs_to :vinculoestado, foreign_key: "id_vinculoestado", 
            validate: true, class_name: "Sivel2Gen::Vinculoestado"
          belongs_to :presponsable, foreign_key: "organizacionarmada", 
            validate: true, class_name: "Sivel2Gen::Presponsable"

          validates :caso, presence: true
          validates :persona, presence: true

          def sivel2_gen_victima_presenta(atr)
            presenta_gen(atr)
          end

          def presponsables_caso
            r = ''
            if self.caso && self.caso.presponsable
              r = self.caso.presponsable.inject("") { |memo, pr|
                (memo == '' ? '' : '; ') + pr.id.to_s
              }
            end
            r
          end

          def ubicacion_caso
            r = ''
            if self.caso && self.caso.ubicacion && self.caso.ubicacion.count>0
              r += self.caso.ubicacion[0].departamento ?
                self.caso.ubicacion[0].departamento.nombre : ''
              r += ' - '
              r += self.caso.ubicacion[0].municipio ?
                self.caso.ubicacion[0].municipio.nombre : ''
            end
            r
          end

          def presenta(atr)
            case atr.to_s
            when 'fecha_caso_localizada'
              self.caso ? self.caso.fecha_localizada : ''
            when 'nombre'
              self.persona ? self.persona.presenta_nombre : ''
            else
              sivel2_gen_victima_presenta(atr)
            end
          end

        end
      end
    end
  end
end

