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

          has_and_belongs_to_many :antecedente, 
            class_name: 'Sivel2Gen::Antecedente',
            foreign_key: :id_victima, 
            association_foreign_key: 'id_antecedente',
            join_table: 'sivel2_gen_antecedente_victima'
         
          has_and_belongs_to_many :contextovictima,
            class_name: "Sivel2Gen::Contextovictima",
            foreign_key: :victima_id,
            validate: true,
            association_foreign_key: :contextovictima_id,
            join_table: 'sivel2_gen_contextovictima_victima',
            optional: true

          # En el orden de esquema en base
          belongs_to :caso, foreign_key: "id_caso", validate: true,
            class_name: "Sivel2Gen::Caso"
          belongs_to :etnia, foreign_key: "id_etnia", validate: true,
            class_name: "Sivel2Gen::Etnia", optional: true
          belongs_to :filiacion, foreign_key: "id_filiacion",
            validate: true, class_name: "Sivel2Gen::Filiacion", optional: true
          belongs_to :iglesia, foreign_key: "id_iglesia", validate: true,
            class_name: "Sivel2Gen::Iglesia", optional: true
          belongs_to :organizacion, foreign_key: "id_organizacion",
            validate: true, class_name: "Sivel2Gen::Organizacion", optional: true
          belongs_to :persona, foreign_key: "id_persona", validate: true,
            class_name: "Sip::Persona"
          accepts_nested_attributes_for :persona, reject_if: :all_blank
          belongs_to :profesion, foreign_key: "id_profesion", validate: true,
            class_name: "Sivel2Gen::Profesion", optional: true
          belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true,
            class_name: "Sivel2Gen::Rangoedad", optional: true
          belongs_to :sectorsocial, foreign_key: "id_sectorsocial",
            validate: true, class_name: "Sivel2Gen::Sectorsocial",
            optional: true
          belongs_to :vinculoestado, foreign_key: "id_vinculoestado",
            validate: true, class_name: "Sivel2Gen::Vinculoestado",
            optional: true
          belongs_to :presponsable, foreign_key: "organizacionarmada",
            validate: true, class_name: "Sivel2Gen::Presponsable",
            optional: true

          validates :caso, presence: true
          validates :persona, presence: true

          ## AUXILIARES PARA PRESENTAR INFORMACIÓN

          def departamento_caso
            r = ''
            if self.caso && self.caso.ubicacion && self.caso.ubicacion.count>0
              r += self.caso.ubicacion[0].departamento ?
                self.caso.ubicacion[0].departamento.nombre : ''
            end
            r
          end

          def municipio_caso
            r = ''
            if self.caso && self.caso.ubicacion && self.caso.ubicacion.count>0
              r += self.caso.ubicacion[0].municipio ?
                self.caso.ubicacion[0].municipio.nombre : ''
            end
            r
          end

          def presponsables_caso
            r = ''
            if self.caso && self.caso.presponsable
              r = self.caso.presponsable.inject("") { |memo, pr|
                (memo == '' ? '' : memo + '; ') + pr.nombre
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

          def trimestre_caso
            r = ''
            if self.caso
              f = self.caso.fecha
              r = f.year.to_s
              r += '-'
              t = f.month/4
              t = t.to_i.to_s
              r += t
            end
          end

          def sivel2_gen_victima_presenta(atr)
            case atr.to_s
            when 'fecha_caso_localizada'
              self.caso ? self.caso.fecha_localizada : ''
            when 'nombre'
              self.persona ? self.persona.presenta_nombre : ''
            when 'profesion'
              self.profesion ? self.profesion.presenta_nombre : ''
            when /rot[0-9]+/
              num=atr.to_s[3..-1].to_i
              if @pconsolidado.nil?
                @pconsolidado = Sivel2Gen::Pconsolidado.
                  where(fechadeshabilitacion: nil).order(:id).map { |r|
                  [r.id, r.nombre, Sivel2Gen::Categoria.
                   where(id_pconsolidado: r.id).map(&:id)]
                }
              end
              return "" if num == 0 || num >= @pconsolidado.count
              p = @pconsolidado[num-1]
              cat = p[2]
              if self.caso.acto.where(id_categoria: cat,
                                    id_persona: self.persona.id).count > 0
                1
              else
                ""
              end
            when 'sexo'
              self.persona ? self.persona.sexo : ''
            else
              presenta_gen(atr)
            end
          end

          def presenta(atr)
            sivel2_gen_victima_presenta(atr)
          end

          scope :filtro_fecha_caso_localizadaini, lambda { |f|
            # En realidad no llega localizada
            joins(:caso).where('sivel2_gen_caso.fecha>=?', f)
          }

          scope :filtro_fecha_caso_localizadafin, lambda { |f|
            # En realidad no llega localizada
            joins(:caso).where('sivel2_gen_caso.fecha<=?', f)
          }

          scope :filtro_id_caso, lambda { |i|
            where(id_caso: i)
          }

          scope :filtro_pconsolidado, lambda { |p|
            sel = p.split('_')
            pc = sel[0].to_i
            op = sel[1]
            c = Sivel2Gen::Pconsolidado.find(pc)
            l = c.categoria.map(&:id)
            case op
            when 'Todos'
              joins('JOIN sivel2_gen_acto ON sivel2_gen_victima.id_caso' +
                    ' = sivel2_gen_acto.id_caso')
            when 'Si'
              joins('JOIN sivel2_gen_acto ON sivel2_gen_victima.id_caso' +
                    ' = sivel2_gen_acto.id_caso')
                .where('sivel2_gen_acto.id_categoria IN (?)', l)
            when 'No'
              joins('JOIN sivel2_gen_acto ON sivel2_gen_victima.id_caso' +
                    ' = sivel2_gen_acto.id_caso')
                .where('sivel2_gen_acto.id_categoria NOT IN (?)', l)
            end
          }

          scope :filtro_ubicacion_caso, lambda { |u|
            joins('JOIN sip_ubicacion ON sivel2_gen_victima.id_caso=sip_ubicacion.id_caso').
              joins('LEFT JOIN sip_departamento ON sip_ubicacion.id_departamento=sip_departamento.id').
              joins('LEFT JOIN sip_municipio ON sip_ubicacion.id_municipio=sip_municipio.id').
              where("(unaccent(sip_departamento.nombre) || ' - ' || " +
                "unaccent(sip_municipio.nombre))" +
                    " ILIKE '%' || unaccent(?) || '%'", u)
          }

          scope :filtro_nombre, lambda { |n|
            joins(:persona).
              where("(unaccent(sip_persona.nombres) || ' ' || " +
                    " unaccent(sip_persona.apellidos)) " +
                    " ILIKE '%' || unaccent(?) || '%'", n)
          }

          def importa(datosent, datossal, menserror, opciones = {})
            v = datosent[1]
            def crea_persona(p, v)
              if p['id_persona'].to_i == v['id_persona'].to_i
                per = Sip::Persona.new
                if p['nombre'].nil?
                  per.nombres = 'N'
                else
                  per.nombres = p['nombre']
                end
                if p['apellido'].nil?
                  per.apellidos = 'N'
                else
                  per.apellidos = p['apellido']
                end
                if p['docid']
                  siglatdoc = p['docid'].split(' ')[0]
                  per.tdocumento = Sip::Tdocumento.where(sigla: siglatdoc)[0]
                  per.numerodocumento = p['docid'].split(' ')[1]
                end 
                if p['fecha_nacimiento']
                  nac = p['fecha_nacimiento'].split('-')
                  per.anionac = nac[0].to_i if nac[0].to_i > 0
                  per.mesnac = nac[1].to_i if (1..12).include?(nac[1].to_i)
                  per.dianac = nac[2].to_i if (1..31).include?(nac[2].to_i)
                end 
                per.sexo = p['sexo'] if p['sexo']
                def recorrer_observaciones_p(ele, per)
                 case ele[0]
                 when 'etnia'
                   self.id_etnia = Sivel2Gen::Etnia.where(nombre: ele[1]).ids[0]
                 when 'pais'
                   per.id_pais = Sip::Pais.where(nombre: ele[1]).ids[0]
                 when 'departamento'
                   per.id_departamento = Sip::Departamento.
                     where(nombre: ele[1], id_pais: per.id_pais).ids[0]
                 when 'municipio'
                   per.id_municipio = Sip::Municipio.
                     where(nombre: ele[1], id_departamento: per.id_departamento).ids[0]
                 when 'centro_poblado'
                   per.id_clase = Sip::Clase.
                     where(nombre: ele[1], id_municipio: per.id_municipio).ids[0]
                 end
                end
                if p['observaciones']              
                  if p['observaciones'].kind_of?(Array)
                    p['observaciones'].each do |ob|
                      ele = ob.split(/\_([^_]*)$/)
                      recorrer_observaciones_p(ele, per)
                    end
                  else 
                    ele = p['observaciones'].split(/\_([^_]*)$/)
                    recorrer_observaciones_p(ele, per)
                  end
                end
                per.save!
                self.id_persona = per.id
              end  
            end
            if datosent[0]['persona'].kind_of?(Array)
              datosent[0]['persona'].each do |p|
                crea_persona(p, v)
              end
            else
              p = datosent[0]['persona']
              crea_persona(p, v)
            end
            self.id_profesion = Sivel2Gen::Profesion.where(nombre: v['ocupacion']).ids[0]
            self.id_sectorsocial = Sivel2Gen::Sectorsocial.where(nombre: v['sector_condicion']).ids[0]
            self.id_iglesia = Sivel2Gen::Iglesia.where(nombre: v['iglesia']).ids[0]
            self.id_organizacion = Sivel2Gen::Organizacion.where(nombre: v['organizacion'].strip).ids[0]
            def recorrer_observaciones_v(ele)
              case ele[0]
              when 'filiacion'
                self.id_filiacion = Sivel2Gen::Filiacion.
                  where(nombre: ele[1].strip).ids[0]
              when 'vinculoestado'
                self.id_vinculoestado = Sivel2Gen::Vinculoestado.
                  where(nombre: ele[1]).ids[0]
              when 'organizacion_armada'
                if ele[1].to_i == 0
                  self.organizacionarmada = Sivel2Gen::Presponsable.
                    where(nombre: 'SIN INFORMACIÓN').ids[0]
                else 
                  self.organizacionarmada = Sivel2Gen::Presponsable.
                    find(id: ele[1].to_i).id
                end
              when 'rangoedad'
                self.id_rangoedad = Sivel2Gen::Rangoedad.
                  where(rango: ele[1]).ids[0]
              when 'hijos'
                self.hijos = ele[1]
              when 'anotaciones'
                self.anotaciones = ele[1]
              end
            end           
            if v['observaciones'].kind_of?(Array)
              v['observaciones'].each do |ob|
                ele = ob.split(/\_([^_]*)$/)
                recorrer_observaciones_v(ele)
              end
            else
              ele = v['observaciones'].split(/\_([^_]*)$/)
              recorrer_observaciones_v(ele)
            end
            self.save!
          end
        end
      end
    end
  end
end
