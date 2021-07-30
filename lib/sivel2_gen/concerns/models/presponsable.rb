# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Presponsable
        extend ActiveSupport::Concern

        include Sip::Basica
        included do


          belongs_to :papa, validate: false, 
            class_name: 'Sivel2Gen::Presponsable', optional: true

          has_many :acto, foreign_key: "id_presponsable", validate: true, 
            class_name: 'Sivel2Gen::Acto'
          has_many :actocolectivo, foreign_key: "id_presponsable", 
            validate: true, class_name: 'Sivel2Gen::Actocolectivo'
          has_many :caso_presponsable, foreign_key: "id_presponsable", 
            validate: true, class_name: 'Sivel2Gen::CasoPresponsable'
          has_many :caso_categoria_presponsable, 
            through: :caso_presponsable, 
            class_name: 'Sivel2Gen::CasoCategoriaPresponsable'
          has_many :caso, through: :caso_presponsable, 
            class_name: 'Sivel2Gen::Caso'
          has_many :hijos, foreign_key: "papa_id", validate: false, 
            class_name: 'Sivel2Gen::Presponsable'
          has_many :victima, foreign_key: "organizacionarmada", 
            validate: true, 
            class_name: 'Sivel2Gen::Victima'
          has_many :victimacolectiva, foreign_key: "organizacionarmada", 
            validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
          has_many :combatiente, foreign_key: "organizacionarmada", 
            validate: true, class_name: 'Sivel2Gen::Combatiente'

          def polo_id
            r=Sivel2Gen::Presponsable.connection.execute <<-SQL
              SELECT sivel2_gen_polo_id(#{self.id});
            SQL
            return r[0]["sivel2_gen_polo_id"]
          end

          def polo_nombre
            r=Sivel2Gen::Presponsable.connection.execute <<-SQL
              SELECT sivel2_gen_polo_nombre(#{self.id});
            SQL
            return r[0]["sivel2_gen_polo_nombre"]
          end

          def nombre_con_polo
            if self.id == polo_id
              self.nombre
            else
              polo_nombre + " - " + self.nombre
            end
          end

        end

      end
    end
  end
end
