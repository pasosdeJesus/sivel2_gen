# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Victimacolectiva
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sivel2_gen_victimacolectiva'
          has_many :antecedente_victimacolectiva, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::AntecedenteVictimacolectiva",
            validate: true, dependent: :delete_all
          has_many :antecedente, through: :antecedente_victimacolectiva, 
            class_name: 'Sivel2Gen::Antecedente'
          has_many :filiacion_victimacolectiva, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::FiliacionVictimacolectiva",
            dependent: :delete_all
          has_many :filiacion, through: :filiacion_victimacolectiva, 
            class_name: 'Sivel2Gen::Filiacion'
          has_many :organizacion_victimacolectiva, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::OrganizacionVictimacolectiva",
            dependent: :delete_all
          has_many :organizacion, through: :organizacion_victimacolectiva, 
            class_name: 'Sivel2Gen::Organizacion'
          has_many :profesion_victimacolectiva, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::ProfesionVictimacolectiva",
            dependent: :delete_all
          has_many :profesion, through: :profesion_victimacolectiva, 
            class_name: 'Sivel2Gen::Profesion'
          has_many :rangoedad_victimacolectiva, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::RangoedadVictimacolectiva",
            dependent: :delete_all
          has_many :rangoedad, through: :rangoedad_victimacolectiva, 
            class_name: 'Sivel2Gen::Rangoedad'
          has_many :sectorsocial_victimacolectiva, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::SectorsocialVictimacolectiva",
            validate: true, dependent: :delete_all
          has_many :sectorsocial, through: :sectorsocial_victimacolectiva, 
            class_name: 'Sivel2Gen::Sectorsocial'
          has_many :victimacolectiva_vinculoestado, 
            foreign_key: :victimacolectiva_id, 
            class_name: "Sivel2Gen::VictimacolectivaVinculoestado",
            validate: true, dependent: :delete_all
          has_many :vinculoestado, through: :victimacolectiva_vinculoestado, 
            class_name: 'Sivel2Gen::Vinculoestado'

          # En el orden de esquema en base 
          belongs_to :grupoper, foreign_key: "id_grupoper", validate: true, 
            class_name: "Sip::Grupoper"
          accepts_nested_attributes_for :grupoper, reject_if: :all_blank
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso"
          belongs_to :presponsable, foreign_key: "organizacionarmada", 
            validate: true, class_name: "Sivel2Gen::Presponsable"

          validates :caso, presence: true
          validates :grupoper, presence: true
        end
      end
    end
  end
end

