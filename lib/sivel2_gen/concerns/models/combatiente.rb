# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Combatiente
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sivel2_gen_combatiente'
            
          has_and_belongs_to_many :antecedente,
            class_name: 'Sivel2Gen::Antecedente',
            foreign_key: :id_combatiente, 
            association_foreign_key: :id_antecedente,
            join_table: 'sivel2_gen_antecedente_combatiente'

          # En el orden de esquema en base 
          belongs_to :resagresion, foreign_key: "id_resagresion", 
            validate: true, class_name: "Sivel2Gen::Resagresion"
          belongs_to :profesion, foreign_key: "id_profesion", validate: true, 
            class_name: "Sivel2Gen::Profesion"
          belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true, 
            class_name: "Sivel2Gen::Rangoedad"
          belongs_to :filiacion, foreign_key: "id_filiacion", 
            validate: true, class_name: "Sivel2Gen::Filiacion"
          belongs_to :sectorsocial, foreign_key: "id_sectorsocial", 
            validate: true, class_name: "Sivel2Gen::Sectorsocial"
          belongs_to :organizacion, foreign_key: "id_organizacion", 
            validate: true, class_name: "Sivel2Gen::Organizacion"
          belongs_to :vinculoestado, foreign_key: "id_vinculoestado", 
            validate: true, class_name: "Sivel2Gen::Vinculoestado"
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso"
          belongs_to :presponsable, foreign_key: "organizacionarmada", 
            validate: true, class_name: "Sivel2Gen::Presponsable"

          validates :caso, presence: true
          validates :nombre, presence: true
          validates :nombre, length: { maximum: 500 }
          validates :alias, length: { maximum: 500 }
          validates :sexo, presence: true
          validates :sexo, length: { maximum: 1 }
          validates :resagresion, presence: true
        end
      end
    end
  end
end

