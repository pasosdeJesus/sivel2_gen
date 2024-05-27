
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
            association_foreign_key: 'antecedente_id',
            join_table: 'sivel2_gen_antecedente_victimacolectiva'

          has_and_belongs_to_many :etnia, 
            class_name: 'Msip::Etnia',
            foreign_key: :victimacolectiva_id, 
            validate: true, 
            association_foreign_key: 'etnia_id',
            join_table: 'sivel2_gen_etnia_victimacolectiva'

          has_and_belongs_to_many :filiacion, 
            class_name: 'Sivel2Gen::Filiacion',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: 'filiacion_id',
            join_table: 'sivel2_gen_filiacion_victimacolectiva'

          has_and_belongs_to_many :organizacion, 
            class_name: 'Sivel2Gen::Organizacion',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: 'organizacion_id',
            join_table: 'sivel2_gen_organizacion_victimacolectiva'

          has_and_belongs_to_many :profesion,
            class_name: 'Sivel2Gen::Profesion',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: :profesion_id,
            join_table: 'sivel2_gen_profesion_victimacolectiva'

          has_and_belongs_to_many :rangoedad,
            class_name: 'Sivel2Gen::Rangoedad',
            foreign_key: :victimacolectiva_id, 
            association_foreign_key: :rangoedad_id,
            join_table: 'sivel2_gen_rangoedad_victimacolectiva'

          has_and_belongs_to_many :sectorsocial, 
            class_name: 'Sivel2Gen::Sectorsocial',
            foreign_key: :victimacolectiva_id, 
            validate: true, 
            association_foreign_key: :sectorsocial_id,
            join_table: 'sivel2_gen_sectorsocial_victimacolectiva'

          has_and_belongs_to_many :vinculoestado,
            class_name: 'Sivel2Gen::Vinculoestado',
            foreign_key: :victimacolectiva_id, 
            validate: true,
            association_foreign_key: :vinculoestado_id,
            join_table: 'sivel2_gen_victimacolectiva_vinculoestado'

          # En el orden de esquema en base 
          belongs_to :grupoper, foreign_key: "grupoper_id", validate: true, 
            class_name: "Msip::Grupoper", optional: false
          accepts_nested_attributes_for :grupoper, reject_if: :all_blank
          belongs_to :caso, foreign_key: "caso_id", validate: true, 
            class_name: "Sivel2Gen::Caso", optional: false
          belongs_to :presponsable, foreign_key: "organizacionarmada", 
            validate: true, class_name: "Sivel2Gen::Presponsable",
            optional: true

          validates :caso, presence: true
          validates :grupoper, presence: true

          before_destroy do
            Sivel2Gen::Actocolectivo.where(
              caso_id: caso_id, grupoper_id: grupoper_id).delete_all
          end

          def importa(g, datossal, menserror, opciones = {})
            #Se verifica que el grupo no sea un presunto responsable
            gp = Msip::Grupoper.new
            gp.nombre = g['nombre_grupo']
            gp.save!
            self.grupoper_id = gp.id
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
                when 'anotaciones'
                  self.grupoper.anotaciones = ele[1] if self.grupoper
                when 'personasaprox'
                  self.personasaprox = ele[1].to_i
                when 'organizacionarmada'
                  self.organizacionarmada = ele[1].to_i
                when 'filiacion'
                  ele[1].split(";").each do |fil|
                    filiacion = Sivel2Gen::Filiacion.where(nombre: fil)
                    if filiacion.count == 1
                      fv = Sivel2Gen::FiliacionVictimacolectiva.new
                      fv.filiacion_id = filiacion[0].id
                      fv.victimacolectiva_id = self.id
                      fv.save!
                    else
                      menserror << "En la tabla básica Organización no está " +
                        "'#{fil}'"
                    end
                  end
                when 'organizacion'
                  ele[1].split(";").each do |org|
                    organizacion = Sivel2Gen::Organizacion.where(nombre: org)
                    if organizacion.count == 1
                      orgv = Sivel2Gen::OrganizacionVictimacolectiva.new
                      orgv.organizacion_id = organizacion[0].id
                      orgv.victimacolectiva_id = self.id
                      orgv.save!
                    else
                      menserror << "En la tabla básica Organización no está " +
                        "'#{org}'"
                    end
                  end
                when 'profesion'
                  ele[1].split(";").each do |pro|
                    profesion = Sivel2Gen::Profesion.where(nombre: pro)
                    if profesion.count == 1
                      pr = Sivel2Gen::ProfesionVictimacolectiva.new
                      pr.profesion_id = profesion[0].id
                      pr.victimacolectiva_id = self.id
                      pr.save!
                    else
                      menserror << "En la tabla básica Profesión no está " +
                        "'#{pro}'"
                    end
                  end
                when 'rangoedad'
                  ele[1].split(";").each do |ran|
                    rangoedad = Sivel2Gen::Rangoedad.where(nombre: ran)
                    if rangoedad.count == 1
                      re = Sivel2Gen::RangoedadVictimacolectiva.new
                      re.rangoedad_id = rangoedad[0].id
                      re.victimacolectiva_id = self.id
                      re.save!
                    else
                      menserror << "En la tabla básica Rango Edad no está " +
                        "'#{ran}'"
                    end
                  end
                when 'sectorsocial'
                  ele[1].split(";").each do |sec|
                    sectorsocial = Sivel2Gen::Sectorsocial.where(nombre: sec)
                    if sectorsocial.count == 1
                      ss = Sivel2Gen::SectorsocialVictimacolectiva.new
                      ss.sectorsocial_id = sectorsocial[0].id
                      ss.victimacolectiva_id = self.id
                      ss.save!
                    else
                      menserror << "En la tabla básica Sector Social no está " +
                        "'#{sec}'"
                    end
                  end
                when 'vinculoestado'
                  ele[1].split(";").each do |ves|
                    vinculoe = Sivel2Gen::Vinculoestado.where(nombre: ves)
                    if vinculoe.count == 1
                      ve = Sivel2Gen::VictimacolectivaVinculoestado.new
                      ve.vinculoestado_id = vinculoe[0].id
                      ve.victimacolectiva_id = self.id
                      ve.save!
                    else
                      menserror << "En la tabla básica Vínculo Estado no está " +
                        "'#{ves}'"
                    end
                  end
                when 'antecedente'
                  ele[1].split(";").each do |ant|
                    antecedente = Sivel2Gen::Antecedente.where(nombre: ant)
                    if antecedente.count == 1
                      vant = Sivel2Gen::AntecedenteVictimacolectiva.new
                      vant.antecedente_id = antecedente[0].id
                      vant.victimacolectiva_id = self.id
                      vant.save!
                    else
                      menserror << "En la tabla básica Vínculo Estado no está " +
                        "'#{ant}'"
                    end
                  end
                when 'etnia'
                  ele[1].split(";").each do |etn|
                    etnia = Msip::Etnia.where(nombre: etn)
                    if etnia.count == 1
                      vetn = Sivel2Gen::EtniaVictimacolectiva.new
                      vetn.etnia_id = etnia[0].id
                      vetn.victimacolectiva_id = self.id
                      vetn.save!
                    else
                      menserror << "En la tabla básica Vínculo Estado no está " +
                        "'#{etn}'"
                    end
                  end
                end
              end
            end
            self.save!
          end
        end
      end
    end
  end
end

