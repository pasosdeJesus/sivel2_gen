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

          has_and_belongs_to_many :etnia, 
            class_name: 'Sivel2Gen::Etnia',
            foreign_key: :victimacolectiva_id, 
            validate: true, 
            association_foreign_key: 'etnia_id',
            join_table: 'sivel2_gen_etnia_victimacolectiva'

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

          has_and_belongs_to_many :vinculoestado,
            class_name: 'Sivel2Gen::Vinculoestado',
            foreign_key: :victimacolectiva_id, 
            validate: true,
            association_foreign_key: :id_vinculoestado,
            join_table: 'sivel2_gen_victimacolectiva_vinculoestado'

          # En el orden de esquema en base 
          belongs_to :grupoper, foreign_key: "id_grupoper", validate: true, 
            class_name: "Sip::Grupoper"
          accepts_nested_attributes_for :grupoper, reject_if: :all_blank
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso"
          belongs_to :presponsable, foreign_key: "organizacionarmada", 
            validate: true, class_name: "Sivel2Gen::Presponsable",
            optional: true

          validates :caso, presence: true
          validates :grupoper, presence: true

          before_destroy do
            Sivel2Gen::Actocolectivo.where(
              id_caso: id_caso, id_grupoper: id_grupoper).delete_all
          end

          def importa(g, datossal, menserror, opciones = {})
            #Se verifica que el grupo no sea un presunto responsable
            if Sivel2Gen::Presponsable.where(nombre: g['nombre_grupo']).empty?
              gp = Sip::Grupoper.new
              gp.nombre = g['nombre_grupo']
              gp.save!
              self.id_grupoper = gp.id
              self.save!
              array_obs = []
              if g['observaciones'].kind_of? String
                array_obs.push(g['observaciones'])
              else
                array_obs = g['observaciones']
              end
              if array_obs
                array_obs.each do |ob|
                  ele = ob.split(/\_([^_]*)$/)
                  case ele[0]
                  when 'personasaprox'
                    self.personasaprox = ele[1]
                  when 'organizacion_armada'
                    self.personasaprox = Sivel2Gen::Presponsable.where(nombre: ele[1]).ids[0]
                  when 'filiacion'
                    if Sivel2Gen::Filiacion.where(nombre: ele[1]).count == 1
                      fv = Sivel2Gen::FiliacionVictimacolectiva.new
                      fv.id_filiacion = Sivel2Gen::Filiacion.where(nombre: ele[1]).ids[0]
                      fv.victimacolectiva_id = self.id
                      fv.save!
                    end
                  when 'organizacion'
                    if Sivel2Gen::Organizacion.where(nombre: ele[1]).count == 1
                      org = Sivel2Gen::OrganizacionVictimacolectiva.new
                      org.id_organizacion = Sivel2Gen::Organizacion.where(nombre: ele[1]).ids[0]
                      org.victimacolectiva_id = self.id
                      org.save!
                    else
                      menserror << "En la tabla básica Organización no está " +
                        "'#{ele[1]}'"
                    end
                  when 'profesion'
                    if Sivel2Gen::Profesion.where(nombre: ele[1]).count == 1
                      pr = Sivel2Gen::ProfesionVictimacolectiva.new
                      pr.id_profesion = Sivel2Gen::Profesion.where(nombre: ele[1]).ids[0]
                      pr.victimacolectiva_id = self.id
                      pr.save!
                    else
                      menserror << "En la tabla básica Profesión no está " +
                        "'#{ele[1]}'"
                    end
                  when 'rangoedad'
                    if Sivel2Gen::Rangoedad.where(nombre: ele[1]).count ==1
                      re = Sivel2Gen::RangoedadVictimacolectiva.new
                      re.id_rangoedad = Sivel2Gen::Rangoedad.where(nombre: ele[1]).ids[0]
                      re.victimacolectiva_id = self.id
                      re.save!
                    else
                      menserror << "En la tabla básica Rango Edad no está " +
                        "'#{ele[1]}'"
                    end
                  when 'sectorsocial'
                    if Sivel2Gen::Sectorsocial.where(nombre: ele[1]).count == 1
                      ss = Sivel2Gen::SectorsocialVictimacolectiva.new
                      ss.id_sectorsocial = Sivel2Gen::Sectorsocial.where(nombre: ele[1]).ids[0]
                      ss.victimacolectiva_id = self.id
                      ss.save!
                    else
                      menserror << "En la tabla básica Sector Social no está " +
                        "'#{ele[1]}'"
                    end
                  when 'vinculoestado'
                    if Sivel2Gen::Vinculoestado.where(nombre: ele[1].split("\;")).count == 1
                      ve = Sivel2Gen::VictimacolectivaVinculoestado.new
                      ve.id_vinculoestado = Sivel2Gen::Vinculoestado.where(nombre: ele[1].split("\;")).ids[0]
                      ve.victimacolectiva_id = self.id
                      ve.save!
                    else
                      menserror << "En la tabla básica Vínculo Estado no está " +
                        "'#{ele[1].split("\;")}'"
                    end
                  end
                end  
              end
            end
          end
        end
      end
    end
  end
end

