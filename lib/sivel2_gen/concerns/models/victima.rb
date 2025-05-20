# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Victima
        extend ActiveSupport::Concern

        include Msip::Modelo
        include Msip::Localizacion

        included do
          attr_accessor :edad
          attr_accessor :edadactual

          has_and_belongs_to_many :antecedente,
            class_name: "Sivel2Gen::Antecedente",
            foreign_key: :victima_id,
            association_foreign_key: "antecedente_id",
            join_table: "sivel2_gen_antecedente_victima"

          has_and_belongs_to_many :profesionsec,
            class_name: "Sivel2Gen::Profesion",
            foreign_key: :victima_id,
            association_foreign_key: "profesion_id",
            join_table: "sivel2_gen_profesion_victima"

          has_and_belongs_to_many :sectorsocialsec,
            class_name: "Sivel2Gen::Sectorsocial",
            foreign_key: :victima_id,
            association_foreign_key: "sectorsocial_id",
            join_table: "sivel2_gen_sectorsocialsec_victima"

          has_and_belongs_to_many :otraorga,
            class_name: "Sivel2Gen::Organizacion",
            foreign_key: :victima_id,
            association_foreign_key: "organizacion_id",
            join_table: "sivel2_gen_otraorga_victima"

          has_and_belongs_to_many :contextovictima,
            class_name: "Sivel2Gen::Contextovictima",
            foreign_key: :victima_id,
            validate: true,
            association_foreign_key: :contextovictima_id,
            join_table: "sivel2_gen_contextovictima_victima",
            optional: true

          # En el orden de esquema en base
          belongs_to :caso,
            validate: true,
            class_name: "Sivel2Gen::Caso",
            optional: false
          belongs_to :filiacion,
            validate: true,
            class_name: "Sivel2Gen::Filiacion",
            optional: true
          belongs_to :iglesia,
            validate: true,
            class_name: "Sivel2Gen::Iglesia",
            optional: true
          belongs_to :organizacion,
            validate: true,
            class_name: "Sivel2Gen::Organizacion",
            optional: true
          belongs_to :persona,
            validate: true,
            class_name: "Msip::Persona",
            optional: false
          accepts_nested_attributes_for :persona, reject_if: :all_blank
          belongs_to :profesion,
            validate: true,
            class_name: "Sivel2Gen::Profesion",
            optional: true
          belongs_to :rangoedad,
            validate: true,
            class_name: "Sivel2Gen::Rangoedad",
            optional: true
          belongs_to :sectorsocial,
            validate: true,
            class_name: "Sivel2Gen::Sectorsocial",
            optional: true
          belongs_to :vinculoestado,
            validate: true,
            class_name: "Sivel2Gen::Vinculoestado",
            optional: true
          belongs_to :presponsable,
            foreign_key: "organizacionarmada",
            validate: true,
            class_name: "Sivel2Gen::Presponsable",
            optional: true

          validates :caso, presence: true
          validates :persona, presence: true

          before_destroy do
            Sivel2Gen::Acto.where(caso_id: caso_id, persona_id: persona_id)
              .delete_all
          end
          ## AUXILIARES PARA PRESENTAR INFORMACIÓN

          def departamento_caso
            r = ""
            if caso && caso.ubicacionprincipal
              r += if caso.ubicacionprincipal.pais_id == Msip.paisomision
                if caso.ubicacionprincipal.departamento
                  caso.ubicacionprincipal.departamento.nombre
                else
                  ""
                end
              else
                "Exterior"
              end
            end
            r
          end

          def municipio_caso
            r = ""
            if caso && caso.ubicacionprincipal
              r += if caso.ubicacionprincipal.pais_id == 170 # COLOMBIA
                if caso.ubicacionprincipal.municipio
                  caso.ubicacionprincipal.municipio.nombre
                else
                  ""
                end
              elsif caso.ubicacionprincipal.pais
                caso.ubicacionprincipal.pais.nombre
              else
                ""
              end
            end
            r
          end

          def presponsables_caso
            r = ""
            if caso && caso.presponsable
              r = caso.presponsable.inject("") do |memo, pr|
                (memo == "" ? "" : memo + "; ") + pr.nombre
              end
            end
            r
          end

          def presponsables_caso_ids
            r = ""
            if caso && caso.presponsable
              r = caso.presponsable.inject("") do |memo, pr|
                (memo == "" ? "" : memo + "; ") + pr.id.to_s
              end
            end
            r
          end

          def ubicacion_caso
            r = ""
            if caso && caso.ubicacionprincipal
              if caso.ubicacionprincipal.pais_id == 170
                r += if caso.ubicacionprincipal.departamento
                  caso.ubicacionprincipal.departamento.nombre
                else
                  ""
                end
                r += " - "
                r += if caso.ubicacionprincipal.municipio
                  caso.ubicacionprincipal.municipio.nombre
                else
                  ""
                end
              else
                r += "Exterior - "
                r += if caso.ubicacionprincipal.pais
                  caso.ubicacionprincipal.pais.nombre
                else
                  ""
                end
              end
            end
            r
          end

          def trimestre_caso
            if caso
              f = caso.fecha
              r = f.year.to_s
              r += "-"
              t = f.month / 4
              t = t.to_i.to_s
              r + t
            end
          end

          def sivel2_gen_victima_presenta(atr)
            case atr.to_s
            when "fecha_caso"
              caso ? caso.fecha : ""
            when "nombre"
              persona ? persona.presenta_nombre : ""
            when "profesion"
              profesion ? profesion.presenta_nombre : ""
            when /rot[0-9]+/
              num = atr.to_s[3..-1].to_i
              if @pconsolidado.nil?
                @pconsolidado = Sivel2Gen::Pconsolidado
                  .where(fechadeshabilitacion: nil).order(:id).map do |r|
                  [r.id, r.nombre, Sivel2Gen::Categoria
                    .where(pconsolidado_id: r.id).map(&:id),]
                end
              end
              return "" if num == 0 || num >= @pconsolidado.count

              p = @pconsolidado[num - 1]
              cat = p[2]
              if caso.acto.where(
                categoria_id: cat,
                persona_id: persona.id,
              ).count > 0
                1
              else
                ""
              end
            when "sexo"
              persona ? persona.sexo : ""
            else
              presenta_gen(atr)
            end
          end

          def edad
            if !persona || !caso || !persona.anionac || !caso.fecha
              return
            end

            Msip::EdadSexoHelper.edad_de_fechanac_fecha(
              persona.anionac,
              persona.mesnac,
              persona.dianac,
              caso.fecha.year,
              caso.fecha.month,
              caso.fecha.day,
            )
          end

          def edadactual
            if !persona || !caso || !persona.anionac || !caso.fecha
              return
            end

            Msip::EdadSexoHelper.edad_de_fechanac_fecha(
              persona.anionac,
              persona.mesnac,
              persona.dianac,
              Date.today.year,
              Date.today.month,
              Date.today.day,
            )
          end

          def presenta(atr)
            sivel2_gen_victima_presenta(atr)
          end

          #  Scope para filtros no convencionales de vistas automaticas
          #  En este caso para pconsolidado que puede variar de una base a otra
          scope :filtrar_alterno, lambda { |otros_params_filtro|
            r = self
            opf = otros_params_filtro.permit!.to_h.filter do |l, v|
              l =~ /^buspconsolidado_[0-9]*/ && (v == "Si" || v == "No")
            end
            opf.each do |l, v|
              l =~ /^buspconsolidado_([0-9])*/
              pcon = Sivel2Gen::Pconsolidado.find(::Regexp.last_match(1).to_i)
              lcat = pcon.categoria.map(&:id)
              case v
              when "Si"
                r = r.where(
                  '(sivel2_gen_victima.persona_id,
                    sivel2_gen_victima.caso_id) IN (
                    SELECT DISTINCT persona_id, caso_id  FROM
                    sivel2_gen_acto AS acto WHERE
                        acto.categoria_id IN (?))',
                  lcat,
                )
              when "No"
                r = r.where(
                  '(sivel2_gen_victima.persona_id,
                    sivel2_gen_victima.caso_id) NOT IN (
                    SELECT DISTINCT persona_id, caso_id  FROM
                    sivel2_gen_acto AS acto WHERE
                        acto.categoria_id IN (?))',
                  lcat,
                )
              end
            end
            r
          }

          scope :filtro_etiqueta_caso, lambda { |i|
            joins("JOIN sivel2_gen_caso_etiqueta
              AS casoetiqueta ON
              sivel2_gen_victima.caso_id= casoetiqueta.caso_id")
              .where("casoetiqueta.etiqueta_id =?", i)
          }

          scope :filtro_fecha_casoini, lambda { |f|
            # En realidad no llega localizada
            joins(:caso).where("sivel2_gen_caso.fecha>=?", f)
          }

          scope :filtro_fecha_casofin, lambda { |f|
            # En realidad no llega localizada
            joins(:caso).where("sivel2_gen_caso.fecha<=?", f)
          }

          scope :filtro_caso_id, lambda { |i|
            where(caso_id: i)
          }

          scope :filtro_ubicacion_caso, lambda { |u|
            joins("JOIN msip_ubicacion ON sivel2_gen_victima.caso_id=msip_ubicacion.caso_id")
              .joins("LEFT JOIN msip_departamento ON msip_ubicacion.departamento_id=msip_departamento.id")
              .joins("LEFT JOIN msip_municipio ON msip_ubicacion.municipio_id=msip_municipio.id")
              .where("(unaccent(msip_departamento.nombre) || ' - ' || " +
                "unaccent(msip_municipio.nombre))" +
                    " ILIKE '%' || unaccent(?) || '%'",
                u)
          }

          scope :filtro_nombre, lambda { |n|
            joins(:persona)
              .where("(unaccent(msip_persona.nombres) || ' ' || " +
                    " unaccent(msip_persona.apellidos)) " +
                    " ILIKE '%' || unaccent(?) || '%'",
                n)
          }

          def importa(datosent, datossal, formato_sexo, menserror, opciones = {})
            v = datosent[1]
            def crea_persona(p, v, menserror, formato_sexo)
              if p["id_persona"].to_i == v["id_persona"].to_i
                per = Msip::Persona.new
                per.nombres = if p["nombre"].nil?
                  "N"
                else
                  p["nombre"]
                end
                per.apellidos = if p["apellido"].nil?
                  "N"
                else
                  p["apellido"]
                end
                if p["docid"]
                  siglatdoc = p["docid"].split(" ")[0]
                  per.tdocumento = Msip::Tdocumento.where(sigla: siglatdoc)[0]
                  per.numerodocumento = p["docid"].split(" ")[1]
                end
                if p["fecha_nacimiento"]
                  nac = p["fecha_nacimiento"].split("-")
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
                        Msip::Persona.convencion_sexo[:sexo_masculino].to_s
                    when "F"
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_femenino].to_s
                    when "S"
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                    end
                    begin
                      if per.save
                        per.save
                      else
                        per.sexo =
                          Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                        per.save
                        menserror << "Convención de sexo #{p["sexo"]} no coincide "
                      end
                    rescue => err
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                      menserror << "Convención de sexo #{p["sexo"]} no coincide " +
                        err.cause.to_s
                    end
                  when "sexohms"
                    case p["sexo"]
                    when "H"
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_masculino].to_s
                    when "M"
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_femenino].to_s
                    when "S"
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                    else
                      per.sexo =
                        Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s
                      menserror << "Convención de sexo #{p["sexo"]} seleccionado no coincide" +
                        " con alguna opción del sistema"
                    end
                  else
                    per.sexo = p["sexo"]
                  end
                end

                def recorrer_observaciones_p(ele, per, menserror)
                  case ele[0]
                  when "etnia"
                    per.etnia_id = Msip::Etnia.where("TRIM(nombre)=?", ele[1]).ids[0]
                  when "pais"
                    per.pais_id = Msip::Pais.where("TRIM(nombre)=?", ele[1]).ids[0]
                  when "departamento"
                    per.departamento_id = Msip::Departamento
                      .where("TRIM(nombre)=?", ele[1]).where(pais_id: per.pais_id).ids[0]
                  when "municipio"
                    per.municipio_id = Msip::Municipio
                      .where("TRIM(nombre)=?", ele[1]).where(departamento_id: per.departamento_id).ids[0]
                  when "centro_poblado"
                    per.centropoblado_id = Msip::Centropoblado
                      .where("TRIM(nombre)=?", ele[1]).where(municipio_id: per.municipio_id).ids[0]
                  end
                end
                if p["observaciones"]
                  if p["observaciones"].is_a?(Array)
                    p["observaciones"].each do |ob|
                      ele = ob.split(/\_([^_]*)$/)
                      recorrer_observaciones_p(ele, per, menserror)
                    end
                  else
                    ele = p["observaciones"].split(/\_([^_]*)$/)
                    recorrer_observaciones_p(ele, per, menserror)
                  end
                end
                per.save!
                self.persona_id = per.id
                save!
              end
            end
            if datosent[0]["persona"].is_a?(Array)
              datosent[0]["persona"].each do |per|
                crea_persona(per, v, menserror, formato_sexo)
              end
            else
              p = datosent[0]["persona"]
              crea_persona(p, v, menserror, formato_sexo)
            end
            if v["ocupacion"]
              if Sivel2Gen::Profesion.where("TRIM(nombre)=?", v["ocupacion"].strip).count == 1
                self.profesion_id = Sivel2Gen::Profesion.where("TRIM(nombre)=?", v["ocupacion"].strip).ids[0]
              else
                menserror << "En la tabla básica Profesion no existe " +
                  "'#{v["ocupacion"]}'. "
                pr_sininf = Sivel2Gen::Profesion.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'",
                )
                if pr_sininf.count == 0
                  menserror << "No se encuentra profesión SIN INFORMACIÓN. "
                else
                  self.profesion_id = pr_sininf.ids[0]
                end
              end
            end
            if v["sector_condicion"]
              if Sivel2Gen::Sectorsocial.where("TRIM(nombre)=?", v["sector_condicion"].strip).count == 1
                self.sectorsocial_id = Sivel2Gen::Sectorsocial.where("TRIM(nombre)=?", v["sector_condicion"].strip).ids[0]
              else
                menserror << "En la tabla básica Sector Social no existe " +
                  "'#{v["sector_condicion"]}'. "
                ss_sininf = Sivel2Gen::Sectorsocial.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'",
                )
                if ss_sininf.count == 0
                  menserror << "No se encuentra sector social SIN INFORMACIÓN. "
                else
                  self.sectorsocial_id = ss_sininf.ids[0]
                end
              end
            end
            if v["iglesia"]
              if Sivel2Gen::Iglesia.where("TRIM(nombre)=?", v["iglesia"].strip).count == 1
                self.iglesia_id = Sivel2Gen::Iglesia.where("TRIM(nombre)=?", v["iglesia"].strip).ids[0]
              else
                menserror << "En la tabla básica Iglesia no existe " +
                  "'#{v["iglesia"]}'. "
                ig_sininf = Sivel2Gen::Iglesia.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'",
                )
                if ig_sininf.count == 0
                  menserror << "No se encuentra iglesia SIN INFORMACIÓN. "
                else
                  self.iglesia_id = ig_sininf.ids[0]
                end
              end
            end
            if v["organizacion"]
              if Sivel2Gen::Organizacion.where("TRIM(nombre)=?", v["organizacion"].strip).count == 1
                self.organizacion_id = Sivel2Gen::Organizacion.where("TRIM(nombre)=?", v["organizacion"].strip).ids[0]
              else
                menserror << "En la tabla básica Organización no existe " +
                  "'#{v["organizacion"]}'. "
                org_sininf = Sivel2Gen::Organizacion.where(
                  "nombre LIKE '%SIN INFORMACIÓN%'",
                )
                if org_sininf.count == 0
                  menserror << "No se encuentra organización SIN INFORMACIÓN. "
                else
                  self.organizacion_id = org_sininf.ids[0]
                end
              end
            end

            def recorrer_observaciones_v(ele, menserror)
              case ele[0]
              when "filiacion"
                if Sivel2Gen::Filiacion.where("TRIM(nombre)=?", ele[1].strip).count == 1
                  self.filiacion_id = Sivel2Gen::Filiacion
                    .where("TRIM(nombre)=?", ele[1].strip).ids[0]
                else
                  menserror << "Tabla básica Filiación no tiene '#{ele[1]}'. "
                end
              when "vinculoestado"
                if Sivel2Gen::Vinculoestado.where(
                  "TRIM(nombre)=?", ele[1].strip
                ).count == 1
                  self.vinculoestado_id = Sivel2Gen::Vinculoestado
                    .where("TRIM(nombre)=?", ele[1].strip).ids[0]
                else
                  menserror << "Tabla básica Vinculo estado no tiene '#{ele[1]}'. "
                end
              when "organizacion_armada"
                if Sivel2Gen::Presponsable.where(id: ele[1].to_i).count == 1
                  self.organizacionarmada = Sivel2Gen::Presponsable.find_by(
                    id: ele[1].to_i,
                  ).id
                else
                  menserror << "Tabla básica Presunto Responsable para organización
                    armada de la víctima, no tiene '#{ele[1]}'. "
                end
              when "rangoedad"
                if Sivel2Gen::Rangoedad.where("TRIM(nombre)=?", ele[1].strip).count == 1
                  self.rangoedad_id = Sivel2Gen::Rangoedad
                    .where(nombre: ele[1].strip).ids[0]
                else
                  menserror << "Tabla básica Rango Edad  no tiene '#{ele[1]}'. "
                end
              when "hijos"
                self.hijos = ele[1]
              when "anotaciones"
                self.anotaciones = ele[1]
              when "sectorsocialsec"
                ele[1].split(";").each do |sec|
                  sectorsocial = Sivel2Gen::Sectorsocial.where(nombre: sec)
                  if sectorsocial.count == 1
                    ss = Sivel2Gen::SectorsocialsecVictima.new
                    ss.sectorsocial_id = sectorsocial[0].id
                    ss.victima_id = id
                    ss.save!
                  else
                    menserror << "En la tabla básica Sector Social no está " +
                      "'#{sec}'"
                  end
                end
              when "otraorga"
                ele[1].split(";").each do |org|
                  organizacion = Sivel2Gen::Organizacion.where(nombre: org)
                  if organizacion.count == 1
                    orgv = Sivel2Gen::OtraorgaVictima.new
                    orgv.organizacion_id = organizacion[0].id
                    orgv.victima_id = id
                    orgv.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{org}'"
                  end
                end
              when "profesionsec"
                ele[1].split(";").each do |prof|
                  profesion = Sivel2Gen::Profesion.where(nombre: prof)
                  if profesion.count == 1
                    prov = Sivel2Gen::ProfesionVictima.new
                    prov.profesion_id = profesion[0].id
                    prov.victima_id = id
                    prov.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{org}'"
                  end
                end
              when "contexto"
                ele[1].split(";").each do |cont|
                  contexto = Sivel2Gen::Contextovictima.where(nombre: cont)
                  if contexto.count == 1
                    contv = Sivel2Gen::ContextovictimaVictima.new
                    contv.contextovictima_id = contexto[0].id
                    contv.victima_id = id
                    contv.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{cont}'"
                  end
                end
              when "orientacionsexual"
                self.orientacionsexual = ele[1]
              when "antecedente"
                ele[1].split(";").each do |ante|
                  antecedente = Sivel2Gen::Antecedente.where(nombre: ante)
                  if antecedente.count == 1
                    antv = Sivel2Gen::AntecedenteVictima.new
                    antv.antecedente_id = antecedente[0].id
                    antv.victima_id = id
                    antv.save!
                  else
                    menserror << "En la tabla básica Organización no está " +
                      "'#{ante}'"
                  end
                end
              end
            end

            if v["observaciones"].is_a?(Array)
              v["observaciones"].each do |ob|
                ele = ob.split(/\_([^_]*)$/)
                recorrer_observaciones_v(ele, menserror)
              end
            else
              ele = v["observaciones"].split(/\_([^_]*)$/)
              recorrer_observaciones_v(ele, menserror)
            end
            save ? save! : return
          end
        end
      end
    end
  end
end
