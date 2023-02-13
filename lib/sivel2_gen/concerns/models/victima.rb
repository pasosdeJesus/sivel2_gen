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

          has_and_belongs_to_many :sectorsocialsec, 
            class_name: 'Sivel2Gen::Sectorsocial',
            foreign_key: :victima_id, 
            association_foreign_key: 'sectorsocial_id',
            join_table: 'sivel2_gen_sectorsocialsec_victima'

          has_and_belongs_to_many :otraorga, 
            class_name: 'Sivel2Gen::Organizacion',
            foreign_key: :victima_id, 
            association_foreign_key: 'organizacion_id',
            join_table: 'sivel2_gen_otraorga_victima'

          has_and_belongs_to_many :contextovictima,
            class_name: "Sivel2Gen::Contextovictima",
            foreign_key: :victima_id,
            validate: true,
            association_foreign_key: :contextovictima_id,
            join_table: 'sivel2_gen_contextovictima_victima',
            optional: true

          # En el orden de esquema en base
          belongs_to :caso, foreign_key: "id_caso", validate: true,
            class_name: "Sivel2Gen::Caso", optional: false
          belongs_to :etnia, foreign_key: "id_etnia", validate: true,
            class_name: "Sivel2Gen::Etnia", optional: true
          belongs_to :filiacion, foreign_key: "id_filiacion",
            validate: true, class_name: "Sivel2Gen::Filiacion", optional: true
          belongs_to :iglesia, foreign_key: "id_iglesia", validate: true,
            class_name: "Sivel2Gen::Iglesia", optional: true
          belongs_to :organizacion, foreign_key: "id_organizacion",
            validate: true, class_name: "Sivel2Gen::Organizacion", optional: true
          belongs_to :persona, foreign_key: "id_persona", validate: true,
            class_name: "Sip::Persona", optional: false
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

          before_destroy do
            Sivel2Gen::Acto.where(id_caso: id_caso, id_persona: id_persona).
              delete_all
          end
          ## AUXILIARES PARA PRESENTAR INFORMACIÓN

          def departamento_caso
            r = ''
            if self.caso && self.caso.ubicacionprincipal
              if self.caso.ubicacionprincipal.id_pais == Sip.paisomision
                r += self.caso.ubicacionprincipal.departamento ?
                  self.caso.ubicacionprincipal.departamento.nombre : ''
              else
                r += 'Exterior'
              end
            end
            r
          end

          def municipio_caso
            r = ''
            if self.caso && self.caso.ubicacionprincipal
              if self.caso.ubicacionprincipal.id_pais == 170 # COLOMBIA
                r += self.caso.ubicacionprincipal.municipio ?
                  self.caso.ubicacionprincipal.municipio.nombre : ''
              else
                r += self.caso.ubicacionprincipal.pais ?
                  self.caso.ubicacionprincipal.pais.nombre : ''
              end
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

          def presponsables_caso_ids
            r = ''
            if self.caso && self.caso.presponsable
              r = self.caso.presponsable.inject("") { |memo, pr|
                (memo == '' ? '' : memo + '; ') + pr.id.to_s
              }
            end
            r
          end


          def ubicacion_caso
            r = ''
            if self.caso && self.caso.ubicacionprincipal
              if self.caso.ubicacionprincipal.id_pais == 170
                r += self.caso.ubicacionprincipal.departamento ?
                  self.caso.ubicacionprincipal.departamento.nombre : ''
                r += ' - '
                r += self.caso.ubicacionprincipal.municipio ?
                  self.caso.ubicacionprincipal.municipio.nombre : ''
              else
                r += 'Exterior - '
                r += self.caso.ubicacionprincipal.pais ?
                  self.caso.ubicacionprincipal.pais.nombre : ''
              end
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

          #  Scope para filtros no convencionales de vistas automaticas
          #  En este caso para pconsolidado que puede variar de una base a otra
          scope :filtrar_alterno, lambda { |otros_params_filtro|
            r = self
            opf = otros_params_filtro.permit!.to_h.filter {|l, v|
              l =~ /^buspconsolidado_[0-9]*/ && (v == 'Si' || v == 'No')
            }
            opf.each do |l, v|
              l =~ /^buspconsolidado_([0-9])*/
              pcon = Sivel2Gen::Pconsolidado.find($1.to_i)
              lcat = pcon.categoria.map(&:id)
              case v
              when 'Si'
                r = r.where('(sivel2_gen_victima.id_persona,
                    sivel2_gen_victima.id_caso) IN (
                    SELECT DISTINCT id_persona, id_caso  FROM 
                    sivel2_gen_acto AS acto WHERE 
                        acto.id_categoria IN (?))', lcat)
              when 'No'
                r = r.where('(sivel2_gen_victima.id_persona,
                    sivel2_gen_victima.id_caso) NOT IN (
                    SELECT DISTINCT id_persona, id_caso  FROM 
                    sivel2_gen_acto AS acto WHERE 
                        acto.id_categoria IN (?))', lcat)
              end
            end
            return r
          }

          scope :filtro_etiqueta_caso, lambda { |i|
            joins("JOIN sivel2_gen_caso_etiqueta
              AS casoetiqueta ON
              sivel2_gen_victima.id_caso= casoetiqueta.id_caso").
              where("casoetiqueta.id_etiqueta =?", i)
          }

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

          def importa(datosent, datossal, formato_sexo, menserror, opciones = {})
            v = datosent[1]
            def crea_persona(p, v, menserror, formato_sexo)
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

                if p["sexo"]
                  case formato_sexo
                  when "sexomfs"
                    case p["sexo"]
                    when "M"
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_masculino].to_s
                    when "F"
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_femenino].to_s
                    when "S"
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                    end
                    begin
                      if per.save
                        per.save
                      else
                        per.sexo =
                         Sip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                        per.save
                        menserror << "Convención de sexo #{p["sexo"]} no coincide "
                      end
                    rescue => err
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                      menserror << "Convención de sexo #{p["sexo"]} no coincide " +
                                    err.cause.to_s
                    end
                  when "sexohms"
                    case p["sexo"]
                    when "H"
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_masculino].to_s
                    when "M"
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_femenino].to_s
                    when "S"
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                    else
                      per.sexo =
                        Sip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                      menserror << "Convención de sexo #{p["sexo"]} seleccionado no coincide" +
                                    " con alguna opción del sistema"
                    end
                  else
                    per.sexo = p["sexo"]
                  end
                end

                def recorrer_observaciones_p(ele, per, menserror)
                 self.save!
                 case ele[0]
                 when 'etnia'
                   self.id_etnia = Sivel2Gen::Etnia.where('TRIM(nombre)=?', ele[1]).ids[0]
                 when 'pais'
                   per.id_pais = Sip::Pais.where('TRIM(nombre)=?', ele[1]).ids[0]
                 when 'departamento'
                   per.id_departamento = Sip::Departamento.
                     where('TRIM(nombre)=?', ele[1]).where(id_pais: per.id_pais).ids[0]
                 when 'municipio'
                   per.id_municipio = Sip::Municipio.
                     where('TRIM(nombre)=?', ele[1]).where(id_departamento: per.id_departamento).ids[0]
                 when 'centro_poblado'
                   per.id_clase = Sip::Clase.
                     where('TRIM(nombre)=?', ele[1]).where(id_municipio: per.id_municipio).ids[0]
                 end
                end
                if p['observaciones']              
                  if p['observaciones'].kind_of?(Array)
                    p['observaciones'].each do |ob|
                      ele = ob.split(/\_([^_]*)$/)
                      recorrer_observaciones_p(ele, per, menserror)
                    end
                  else 
                    ele = p['observaciones'].split(/\_([^_]*)$/)
                    recorrer_observaciones_p(ele, per, menserror)
                  end
                end
                per.save!
                self.id_persona = per.id
              end
            end
            if datosent[0]['persona'].kind_of?(Array)
              datosent[0]['persona'].each do |p|
                crea_persona(p, v, menserror, formato_sexo)
              end
            else
              p = datosent[0]['persona']
              crea_persona(p, v, menserror, formato_sexo)
            end
            if v['ocupacion']
              if Sivel2Gen::Profesion.where('TRIM(nombre)=?', v['ocupacion'].strip).count == 1
                self.id_profesion = Sivel2Gen::Profesion.where('TRIM(nombre)=?', v['ocupacion'].strip).ids[0]
              else
                menserror << "En la tabla básica Profesion no existe " +
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
            if v['sector_condicion']
              if Sivel2Gen::Sectorsocial.where('TRIM(nombre)=?', v['sector_condicion'].strip).count == 1
                self.id_sectorsocial = Sivel2Gen::Sectorsocial.where('TRIM(nombre)=?', v['sector_condicion'].strip).ids[0]
              else
                menserror << "En la tabla básica Sector Social no existe " +
                  "'#{v['sector_condicion']}'. "
                ss_sininf = Sivel2Gen::Sectorsocial.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'")
                if ss_sininf.count == 0
                  menserror << "No se encuentra sector social SIN INFORMACIÓN. "
                else
                  self.id_sectorsocial = ss_sininf.ids[0]
                end
              end
            end
            if v['iglesia']
              if Sivel2Gen::Iglesia.where('TRIM(nombre)=?', v['iglesia'].strip).count == 1
                self.id_iglesia = Sivel2Gen::Iglesia.where('TRIM(nombre)=?', v['iglesia'].strip).ids[0]
              else
                menserror << "En la tabla básica Iglesia no existe " +
                  "'#{v['iglesia']}'. "
                ig_sininf = Sivel2Gen::Iglesia.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'")
                if ig_sininf.count == 0
                  menserror << "No se encuentra iglesia SIN INFORMACIÓN. "
                else
                  self.id_iglesia= ig_sininf.ids[0]
                end
              end
            end
            if v['organizacion']
              if Sivel2Gen::Organizacion.where('TRIM(nombre)=?', v['organizacion'].strip).count == 1
                self.id_organizacion = Sivel2Gen::Organizacion.where('TRIM(nombre)=?', v['organizacion'].strip).ids[0]
              else
                menserror << "En la tabla básica Organización no existe " +
                  "'#{v['organizacion']}'. "
                org_sininf = Sivel2Gen::Organizacion.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'")
                if org_sininf.count == 0
                  menserror << "No se encuentra organización SIN INFORMACIÓN. "
                else
                  self.id_organizacion = org_sininf.ids[0]
                end
              end
            end

            def recorrer_observaciones_v(ele, menserror)
              case ele[0]
              when 'filiacion'
                if Sivel2Gen::Filiacion.where('TRIM(nombre)=?', ele[1].strip).count ==1
                  self.id_filiacion = Sivel2Gen::Filiacion.
                    where('TRIM(nombre)=?', ele[1].strip).ids[0]
                else
                  menserror << "Tabla básica Filiación no tiene '#{ele[1]}'. "
                end
              when 'vinculoestado'
                self.id_vinculoestado = Sivel2Gen::Vinculoestado.
                  where('TRIM(nombre)=?', ele[1]).ids[0]
              when 'organizacion_armada'
                self.organizacionarmada = ele[1].to_i
                # Debería ser referencia interna en archivo XRLAT
                # if ele[1].to_i == 0
                # self.organizacionarmada = Sivel2Gen::Presponsable.
                #   where('TRIM(nombre)=?', 'SIN INFORMACIÓN').ids[0]
                #elsif Sivel2Gen::Presponsable.where(id: ele[1]).count
                #  self.organizacionarmada = Sivel2Gen::Presponsable.
                #    find(id: ele[1].to_i).id
                #end
              when 'rangoedad'
                if Sivel2Gen::Rangoedad.where('TRIM(nombre)=?', ele[1].strip).count ==1
                  self.id_rangoedad = Sivel2Gen::Rangoedad.
                    where(nombre: ele[1].strip).ids[0]
                else
                  menserror << "Tabla básica Rango Edad  no tiene '#{ele[1]}'. "
                end  
              when 'hijos'
                  self.hijos = ele[1]
              when 'anotaciones'
                  self.anotaciones = ele[1]
              when 'sectorsocialsec'
                ele[1].split(";").each do |sec|
                  sectorsocial = Sivel2Gen::Sectorsocial.where(nombre: sec)
                  if sectorsocial.count == 1
                    ss = Sivel2Gen::SectorsocialsecVictima.new
                    ss.sectorsocial_id = sectorsocial[0].id
                    ss.victima_id = self.id
                    ss.save!
                  else
                    menserror << "En la tabla básica Sector Social no está " +
                      "'#{sec}'"
                  end
                end
              when 'otraorga'
                ele[1].split(";").each do |org|
                  organizacion = Sivel2Gen::Organizacion.where(nombre: org)
                  if organizacion.count == 1
                    orgv = Sivel2Gen::OtraorgaVictima.new
                    orgv.organizacion_id = organizacion[0].id
                    orgv.victima_id = self.id
                    orgv.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{org}'"
                  end
                end
              when 'contexto'
                ele[1].split(";").each do |cont|
                  contexto = Sivel2Gen::Contextovictima.where(nombre: cont)
                  if contexto.count == 1
                    contv = Sivel2Gen::ContextovictimaVictima.new
                    contv.contextovictima_id = contexto[0].id
                    contv.victima_id = self.id
                    contv.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{cont}'"
                  end
                end
              when 'orientacionsexual'
                self.orientacionsexual = ele[1]
              when 'antecedente'
                ele[1].split(";").each do |ante|
                  antecedente = Sivel2Gen::Antecedente.where(nombre: ante)
                  if antecedente.count == 1
                    antv = Sivel2Gen::AntecedenteVictima.new
                    antv.id_antecedente = antecedente[0].id
                    antv.id_victima = self.id
                    antv.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{ante}'"
                  end
                end
              end
            end

            if v['observaciones'].kind_of?(Array)
              v['observaciones'].each do |ob|
                ele = ob.split(/\_([^_]*)$/)
                recorrer_observaciones_v(ele, menserror)
              end
            else
              ele = v['observaciones'].split(/\_([^_]*)$/)
              recorrer_observaciones_v(ele, menserror)
            end
            self.save ? self.save! : return
          end
        end
      end
    end
  end
end
