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
            validate: true, class_name: "Sivel2Gen::Resagresion",
            optional: true
          belongs_to :profesion, foreign_key: "id_profesion", validate: true, 
            class_name: "Sivel2Gen::Profesion", optional: true
          belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true, 
            class_name: "Sivel2Gen::Rangoedad", optional: true
          belongs_to :filiacion, foreign_key: "id_filiacion", 
            validate: true, class_name: "Sivel2Gen::Filiacion", optional: true
          belongs_to :sectorsocial, foreign_key: "id_sectorsocial", 
            validate: true, class_name: "Sivel2Gen::Sectorsocial", 
            optional: true
          belongs_to :organizacion, foreign_key: "id_organizacion", 
            validate: true, class_name: "Sivel2Gen::Organizacion", 
            optional: true
          belongs_to :vinculoestado, foreign_key: "id_vinculoestado", 
            validate: true, class_name: "Sivel2Gen::Vinculoestado", 
            optional: true
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: "Sivel2Gen::Caso"
          belongs_to :presponsable, foreign_key: "organizacionarmada", 
            validate: true, class_name: "Sivel2Gen::Presponsable", 
            optional: true

          validates :caso, presence: true
          validates :nombre, presence: true
          validates :nombre, length: { maximum: 500 }
          validates :alias, length: { maximum: 500 }
          validates :sexo, presence: true
          validates :sexo, length: { maximum: 1 }
          validates :resagresion, presence: true

          def importa(datosent, datossal, menserror, opciones = {})
            v = datosent[1]
            if v
              if v['nombre']
                self.nombre = v['nombre']
              end
              if v['alias']
                self.alias = v['alias']
              end
              if v['edad']
                self.edad = v['edad']
              end
              if v['sexo']
                self.sexo = v['sexo']
              end
              if v['ocupacion']
                if Sivel2Gen::Profesion.where('TRIM(nombre)=?', v['ocupacion'].strip).count == 1
                  self.id_profesion = Sivel2Gen::Profesion.where('TRIM(nombre)=?', v['ocupacion'].strip).ids[0]
                else
                  menserror << "En la tabla bÃ¡sica Profesion no existe " +
                    "'#{v['ocupacion']}'. "
                  pr_sininf = Sivel2Gen::Profesion.where(
                    "nombre LIKE '%SIN INFORMACIÓN%'")
                  if pr_sininf.count == 0
                    menserror << "No se encuentra profesión SIN INFORMACIÓN. "
                  else
                    self.id_profesion = pr_sininf.ids[0]
                  end
                end
              end
              if v['organizacion']
                if Sivel2Gen::Organizacion.where('TRIM(nombre)=?', v['organizacion'].strip).count == 1
                  self.id_organizacion = Sivel2Gen::Organizacion.where('TRIM(nombre)=?', v['organizacion'].strip).ids[0]
                else
                  menserror << "En la tabla bÃ¡sica OrganizaciÃ³n no existe " +
                    "'#{v['organizacion']}'. "
                  org_sininf = Sivel2Gen::Organizacion.where(
                    "nombre LIKE '%SIN INFORMACIÓN%'")
                  if org_sininf.count == 0
                    menserror << "No se encuentra organizacion SIN INFORMACIÓN. "
                  else
                    self.id_organizacion = org_sininf.ids[0]
                  end
                end
              end

              if v['sector_condicion']
                if Sivel2Gen::Sectorsocial.where('TRIM(nombre)=?', v['sector_condicion'].strip).count == 1
                  self.id_sectorsocial = Sivel2Gen::Sectorsocial.where('TRIM(nombre)=?', v['sector_condicion'].strip).ids[0]
                else
                  menserror << "En la tabla Sector social no existe " +
                    "'#{v['sector_condicion']}'. "
                  sc_sininf = Sivel2Gen::Sectorsocial.where(
                    "nombre LIKE '%SIN INFORMACIÓN%'")
                  if sc_sininf.count == 0
                    menserror << "No se encuentra sector social SIN INFORMACIÓN. "
                  else
                    self.id_sectorsocial = sc_sininf.ids[0]
                  end
                end
              end
              if v['organizacion_armada']
                if Sivel2Gen::Presponsable.where('TRIM(nombre)=?', v['organizacion_armada'].strip).count == 1
                  self.organizacionarmada = Sivel2Gen::Presponsable.where('TRIM(nombre)=?', v['organizacion_armada'].strip).ids[0]
                else
                  menserror << "En la tabla Presponsable no existe " +
                    "'#{v['organizacion_armada']}'. "
                  oa_sininf = Sivel2Gen::Presponsable.where(
                    "nombre LIKE '%SIN INFORMACIÓN%'")
                  if oa_sininf.count == 0
                    menserror << "No se encuentra organización armada SIN INFORMACIÓN. "
                  else
                    self.organizacionarmada = ora_sininf.ids[0]
                  end
                end
              end
              if v['resultado_agresion']
                if Sivel2Gen::Resagresion.where('TRIM(nombre)=?', v['organizacion'].strip).count == 1
                  self.id_resagresion = Sivel2Gen::Resagresion.where('TRIM(nombre)=?', v['resultado_agresion'].strip).ids[0]
                else
                  menserror << "En la tabla resultado agresión no exste " +
                    "'#{v['resultado_agresion']}'. "
                  ra_sininf = Sivel2Gen::Resagresion.where(
                    "nombre LIKE '%SIN INFORMACIÓN%'")
                  if ra_sininf.count == 0
                    menserror << "No se encuentra resagresion SIN INFORMACIÓN. "
                  else
                    self.id_resagresion = ra_sininf.ids[0]
                  end
                end
              end

              def recorrer_observaciones_co(ele, menserror)
                case ele[0]
                when 'filiacion'
                  if Sivel2Gen::Filiacion.where('TRIM(nombre)=?', ele[1].strip).count ==1
                    self.id_filiacion = Sivel2Gen::Filiacion.
                      where('TRIM(nombre)=?', ele[1].strip).ids[0]
                  else
                    menserror << "Tabla básica Filiación no tiene '#{ele[1]}'. "
                  end
                when 'vinculo_estado'
                  if Sivel2Gen::Vinculoestado.
                      where('TRIM(nombre)=?', ele[1]).count == 1
                    self.id_vinculoestado = Sivel2Gen::Vinculoestado.
                      where('TRIM(nombre)=?', ele[1]).ids[0]
                  else
                    menserror << "Tabla básica Vinculo estado no tiene '#{ele[1]}'. "
                  end 
                when 'rangoedad'
                  if Sivel2Gen::Rangoedad.where('TRIM(nombre)=?', ele[1].strip.upcase).count ==1
                    self.id_rangoedad = Sivel2Gen::Rangoedad.
                      where(nombre: ele[1].strip).ids[0]
                  else
                    menserror << "Tabla básica Rango Edad  no tiene '#{ele[1]}'. "
                  end
                when 'contexto'
                  if Sivel2Gen::Antecedente.where('TRIM(nombre)=?', ele[1].strip).count ==1
                    self.antecedente.push(Sivel2Gen::Antecedente.
                      where(nombre: ele[1].strip))
                  else
                    menserror << "Tabla básica Antecedente  no tiene '#{ele[1]}'. "
                  end
                end
              end 
              if v['observaciones']
                if v['observaciones'].kind_of?(Array)
                  v['observaciones'].each do |ob|
                    ele = ob.split(/\_([^_]*)$/)
                    recorrer_observaciones_co(ele, menserror)
                  end
                else
                  ele = v['observaciones'].split(/\_([^_]*)$/)
                    recorrer_observaciones_co(ele, menserror)
                end
              end
            self.save!
            end
          end
        end
      end
    end
  end
end

