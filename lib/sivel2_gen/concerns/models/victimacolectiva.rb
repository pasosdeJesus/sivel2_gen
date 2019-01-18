# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Victimacolectiva
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sivel2_gen_victimacolectiva'

          has_and_belongs_to_many :antecedente, 
            class_name: 'Sivel2Gen::Antecedente',
            foreign_key: :victimacolectiva_id, 
            validate: true, 
            association_foreign_key: 'id_antecedente',
            join_table: 'sivel2_gen_antecedente_victimacolectiva'

          has_and_belongs_to_many :filiacion, 
            class_name: 'Sivel2Gen::Filiacion',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: 'id_filiacion',
            join_table: 'sivel2_gen_filiacion_victimacolectiva'

          has_and_belongs_to_many :organizacion, 
            class_name: 'Sivel2Gen::Organizacion',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: 'id_organizacion',
            join_table: 'sivel2_gen_organizacion_victimacolectiva'

          has_and_belongs_to_many :profesion, 
            class_name: 'Sivel2Gen::Profesion',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: :id_profesion,
            join_table: 'sivel2_gen_profesion_victimacolectiva'

          has_and_belongs_to_many :rangoedad,
            class_name: 'Sivel2Gen::Rangoedad',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: :id_rangoedad,
            join_table: 'sivel2_gen_rangoedad_victimacolectiva'

          has_and_belongs_to_many :sectorsocial, 
            class_name: 'Sivel2Gen::Sectorsocial',
            foreign_key: :victimacolectiva_id, 
            validate: true, 
            association_foreign_key: :id_sectorsocial,
            join_table: 'sivel2_gen_sectorsocial_victimacolectiva'

          has_many :vinculoestado, 
            class_name: 'Sivel2Gen::Vinculoestado',
            foreign_key: :victimacolectiva_id, 
            validate: true, 
            association_foreign_key: 'id_vinculoestado',
            join_table: 'sivel2_gen_victimacolectiva_vinculoestado'

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

