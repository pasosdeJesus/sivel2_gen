
module Sivel2Gen
  module Concerns
    module Models
      module Caso 
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          @current_usuario = nil
          attr_accessor :current_usuario

          # Ordenados por foreign_key para facilitar comparar con esquema en base
          has_many :acto, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Acto'
          accepts_nested_attributes_for :acto, allow_destroy: true, 
            reject_if: :all_blank

          has_many :actocolectivo, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Actocolectivo'

          has_many :anexo_caso, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::AnexoCaso',
            inverse_of: :caso
          accepts_nested_attributes_for :anexo_caso, allow_destroy: true, 
            reject_if: :all_blank
          has_many :msip_anexo, :through => :anexo_caso, 
            class_name: 'Msip::Anexo'
          accepts_nested_attributes_for :msip_anexo,  reject_if: :all_blank

          has_and_belongs_to_many :antecedente,
            class_name: 'Sivel2Gen::Antecedente',
            foreign_key: :caso_id, 
            association_foreign_key: :antecedente_id,
            join_table: 'sivel2_gen_antecedente_caso'

          has_and_belongs_to_many :contexto, 
            class_name: 'Sivel2Gen::Contexto',
            foreign_key: :caso_id, 
            association_foreign_key: :contexto_id,
            join_table: 'sivel2_gen_caso_contexto'

          has_many :caso_etiqueta, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::CasoEtiqueta'
          has_many :etiqueta, through: :caso_etiqueta, 
            class_name: 'Msip::Etiqueta'
          accepts_nested_attributes_for :caso_etiqueta, allow_destroy: true, 
            reject_if: :all_blank
          
          has_many :caso_fotra, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::CasoFotra',
            inverse_of: :caso
          accepts_nested_attributes_for :caso_fotra, allow_destroy: true, 
            reject_if: :all_blank
          has_many :fotra, through: :caso_fotra, class_name: 'Msip::Fotra'

          has_many :caso_fuenteprensa, foreign_key: "caso_id", 
            validate: true, dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoFuenteprensa', inverse_of: :caso
          accepts_nested_attributes_for :caso_fuenteprensa, 
            allow_destroy: true, reject_if: :all_blank
          has_many :fuenteprensa, through: :caso_fuenteprensa, 
            class_name: 'Msip::Fuenteprensa'

          has_and_belongs_to_many :frontera, 
            class_name: 'Sivel2Gen::Frontera',
            foreign_key: 'caso_id',
            association_foreign_key: 'frontera_id',
            join_table: 'sivel2_gen_caso_frontera'

          has_many :caso_presponsable, foreign_key: "caso_id", 
            validate: true, 
            dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoPresponsable'
          has_many :presponsable, through: :caso_presponsable, 
            class_name: 'Sivel2Gen::Presponsable'
          accepts_nested_attributes_for :caso_presponsable, 
            allow_destroy: true, reject_if: :all_blank

          has_and_belongs_to_many :region, 
            class_name: 'Sivel2Gen::Region',
            foreign_key: 'caso_id', 
            association_foreign_key: 'region_id',
            join_table: 'sivel2_gen_caso_region'

          has_and_belongs_to_many :respuestafor, 
            class_name: 'Mr519Gen::Respuestafor',
            foreign_key: 'caso_id',
            association_foreign_key: 'respuestafor_id', 
            join_table: 'sivel2_gen_caso_respuestafor'
          accepts_nested_attributes_for :respuestafor, 
            allow_destroy: true, reject_if: :all_blank

          has_many :caso_usuario, foreign_key: "caso_id", validate: true, 
            class_name: 'Sivel2Gen::CasoUsuario', dependent: :delete_all
          has_many :usuario, :through => :caso_usuario, class_name: 'Usuario'

          has_many :ubicacion, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Msip::Ubicacion'
          accepts_nested_attributes_for :ubicacion, allow_destroy: true, 
            reject_if: :all_blank

          has_many :caso_solicitud, dependent: :delete_all,
            class_name: 'Sivel2Gen::CasoSolicitud',
            foreign_key: 'caso_id'
          has_many :solicitud, through: :caso_solicitud, 
            dependent: :delete_all,
            class_name: 'Msip::Solicitud'
          accepts_nested_attributes_for :solicitud,
            allow_destroy: true, reject_if: :all_blank
          accepts_nested_attributes_for :caso_solicitud,
            allow_destroy: true, reject_if: :all_blank

          has_many :victima,  foreign_key: "caso_id", dependent: :destroy, 
            class_name: 'Sivel2Gen::Victima'
          #, validate: true Manejar en aplicaciones que usen este motor

          has_many :persona, :through => :victima, class_name: 'Msip::Persona'
          accepts_nested_attributes_for :persona,  reject_if: :all_blank
          accepts_nested_attributes_for :victima, allow_destroy: true, 
            reject_if: :all_blank

          has_many :victimacolectiva, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Victimacolectiva' 
          has_many :grupoper, :through => :victimacolectiva, 
            class_name: 'Msip::Grupoper'
          accepts_nested_attributes_for :grupoper,  reject_if: :all_blank
          accepts_nested_attributes_for :victimacolectiva, 
            allow_destroy: true, 
            reject_if: :all_blank

          has_many :combatiente, foreign_key: "caso_id", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Combatiente' 
          accepts_nested_attributes_for :combatiente, allow_destroy: true, 
            reject_if: :all_blank

          has_one :sivel2_gen_conscaso, foreign_key: "caso_id"

          belongs_to :intervalo, foreign_key: "intervalo_id", 
            validate: true, class_name: 'Sivel2Gen::Intervalo', 
            optional: true

          belongs_to :ubicacionprincipal, foreign_key: "ubicacion_id",
            validate: false, class_name: 'Msip::Ubicacion',
            optional: true

          campofecha_localizado :fecha

          validates_presence_of :fecha
          validates :titulo, length: { maximum: 50 }
          validates :hora, length: { maximum: 10 }
          validates :duracion, length: { maximum: 10 }
          validates :grconfiabilidad, length: { maximum: 5 }
          validates :gresclarecimiento, length: { maximum: 5 }
          validates :grimpunidad, length: { maximum: 8 }
          validates :grinformacion, length: { maximum: 8 }
          validate :categoria_presponsable
          validate :caso_no_vacio, on: :update  # Con función para posibilitar sobrecargar
          validate :fuenteprensa_fecha_y_fuente_unicas
          validate :fecha_no_futura 

          def categoria_presponsable
            consl= "WITH RECURSIVE cteRecursion AS (
               SELECT id, 1 AS Level
                   FROM public.sivel2_gen_presponsable
                   WHERE id = 39
               UNION ALL
               SELECT t.id, c.Level+1
                   FROM public.sivel2_gen_presponsable t
                       INNER JOIN cteRecursion c
                           ON t.papa_id = c.id
                       )
               SELECT id, Level
                   FROM cteRecursion
                   ORDER BY Level, id;"
            descendientes_poloe = ActiveRecord::Base.connection.select_all(
              consl)
            descpe_ids = descendientes_poloe.to_a.map{|de| de["id"]} 
            actos = self.acto

            actos.each do |acto|
              tv = acto.categoria.supracategoria.tviolencia_id
              pr = acto.presponsable.id
              cat = acto.categoria
              ce = cat.contadaen if cat
              if ce != nil
                actos_hermanos = actos.where.not(id: acto.id)
                vale = false
                actos_hermanos.each do |ah|
                  if ah.persona == acto.persona && ah.presponsable == acto.presponsable && ah.categoria.id == ce
                    vale = true
                  end
                end
                if !vale
                  errors.add(:categoria_id, "Falta categoría #{ce} requerida por categoría #{cat.id}.")
                end
              end
              if tv == "A" && !descpe_ids.include?(pr) then
                errors.add(:acto, "Si el tipo de violencia es "\
                           "Derechos Humanos el presunto responsable debe "\
                           "ser del Polo Estatal")
              elsif tv == "B" && descpe_ids.include?(pr) then
                errors.add(:acto, "Si el tipo de violencia es "\
                           "Violencia Socio Política el presunto responsable "\
                           "no puede ser del Polo Estatal")
              end
            end
          end

          def caso_no_vacio
            if self.memo.nil? || self.memo == ''
              errors.add(:memo, 'La descripción del caso no debe estar vacía')
            end
          end

          def fecha_no_futura
            if self.fecha && self.fecha > Date.today
            end
          end

          def fuenteprensa_fecha_y_fuente_unicas
            fuentesprensa = self.caso_fuenteprensa
            valfp = []
            fuentesprensa.each do |fp|
              if fp && fp.fuenteprensa && 
                valfp.include?([fp.fecha, fp.fuenteprensa.nombre])
                errors.add(:caso_fuenteprensa, "Fuente de prensa duplicada con misma fecha y fuente")
              else
                valfp.push([fp.fecha, fp.fuenteprensa ? 
                            fp.fuenteprensa.nombre : ''])
              end
            end
          end

          require 'active_support/core_ext/hash' 

          def importa(datosent, datossal, formato_sexo,
                      menserror, opciones = {})
            if datosent['fecha'].nil?
              self.fecha = Date.today
              menserror << "Falta fecha. "
            else
              self.fecha = datosent['fecha']
            end
            self.hora = datosent['hora'] if datosent['hora']
            self.duracion = datosent['duracion'] if datosent['duracion']
            if datosent['hechos'].nil?
              self.memo = ''
              menserror << "Falta descripción de hechos. "
            else
              self.memo = datosent['hechos']
            end
            self.titulo = datosent['titulo'] if datosent['titulo']
            if datosent["observaciones"]
              datosent["observaciones"].each do |obs|
                nombre = obs.split("_")
                case nombre[0]
                when "intervalo"
                  if nombre[1]
                    inter = Sivel2Gen::Intervalo.where(nombre: nombre[1])
                    self.intervalo = inter[0]
                  end
                when "region"
                  if nombre[1]
                    regiones = nombre[1].split("; ")
                    regs = Sivel2Gen::Region.where(nombre: regiones)
                    self.region.push(regs)
                  end
                when "frontera"
                  if nombre[1]
                    fronteras = nombre[1].split("; ")
                    fron = Sivel2Gen::Frontera.where(nombre: fronteras)
                    self.frontera.push(fron)
                  end
                end
              end
            end
            self.save!(validate: false)
            #Importa ubicacion
            ubicacion = Msip::Ubicacion.new
            ubicacion.importa(datosent, datossal, menserror, opciones)
            ubicacion.caso_id = self.id
            ubicacion.save!(validate: false)
            self.ubicacion_id = ubicacion.id
            if datosent['ubicacion_secundaria']
              if datosent['ubicacion_secundaria'].kind_of?(Array)
                datosent['ubicacion_secundaria'].each do |ub|
                  ubicacion = Msip::Ubicacion.new
                  ubicacion.importa(ub, datossal, menserror, opciones)
                  ubicacion.caso_id = self.id
                  ubicacion.save!(validate: false)
                end
              else
                  ubicacion = Msip::Ubicacion.new
                  ubicacion.importa(
                    datosent['ubicacion_secundaria'], datossal, menserror, 
                    opciones)
                  ubicacion.caso_id = self.id
                  ubicacion.save!(validate: false)
              end
            end

            #Importa presunto responsable
            if datosent['grupo']
              if datosent['grupo'].kind_of?(Array)
                datosent['grupo'].each do |pr|
                  casopresp = Sivel2Gen::CasoPresponsable.new
                  casopresp.importa(pr, datossal, menserror, opciones)
                  if casopresp.presponsable_id
                    casopresp.caso_id = self.id
                    casopresp.save!(validate: false)
                  end
                end
              else
                casopresp = Sivel2Gen::CasoPresponsable.new
                casopresp.importa(
                  datosent['grupo'], datossal, menserror, opciones)
                if casopresp.presponsable_id
                  casopresp.caso_id = self.id
                  casopresp.save!(validate: false)
                end
              end
            end

            #Importa grupos victimizados
            idsvcol = {}
            if datosent['grupo']
              if datosent['grupo'].kind_of?(Array)
                datosent['grupo'].each do |vc|
                  victcol = Sivel2Gen::Victimacolectiva.new
                  victcol.caso_id = self.id
                  victcol.importa(vc, datossal, menserror, opciones)
                  idsvcol[vc['id_grupo']] = victcol.grupoper_id
                end
              else
                victcol = Sivel2Gen::Victimacolectiva.new
                victcol.caso_id = self.id
                victcol.importa(
                  datosent['grupo'], datossal, menserror, opciones)
                idsvcol[datosent['grupo']['grupo_id']] = victcol.grupoper_id
              end
            end
            #Importa victimas
            idsv = {}
            if datosent['victima']
              if datosent['victima'].kind_of?(Array)
                datosent['victima'].each do |v|
                  vict = Sivel2Gen::Victima.new
                  vict.caso_id = self.id
                  vict.importa([datosent, v], datossal, formato_sexo,
                               menserror, opciones)
                  idsv[v['id_persona']] = vict.persona_id
                end
              else
                vict = Sivel2Gen::Victima.new
                vict.caso_id = self.id
                vict.importa(
                              [datosent, datosent["victima"]], datossal,
                              formato_sexo, menserror, opciones
                            )
                idsv[datosent['victima']['id_persona']] = vict.persona_id
              end
            end
            #Importa combatientes
            if datosent['combatiente']
              if datosent['combatiente'].kind_of?(Array)
                datosent['combatiente'].each do |co|
                  com = Sivel2Gen::Combatiente.new
                  com.caso_id = self.id
                  com.importa([datosent, co], datossal, menserror, opciones)
                end
              else
                com = Sivel2Gen::Combatiente.new
                com.caso_id = self.id
                com.importa(
                  [datosent, datosent['combatiente']], datossal, menserror, 
                  opciones)
              end
            end
            #Importa actos individuales
            if datosent['acto']
              if datosent['acto'].kind_of?(Array)
                datosent['acto'].each do |ac|
                  acto = Sivel2Gen::Acto.new
                  acto.caso_id = self.id
                  datosactos = [idsv, ac]
                  acto.importa(datosactos, datossal, menserror, opciones)
                end
              else
                acto = Sivel2Gen::Acto.new
                acto.caso_id = self.id
                datosactos = [idsv, datosent['acto']]
                acto.importa(datosactos, datossal, menserror, opciones)
              end
            end
            #Importa actos colectivos
            if datosent['acto']
              if datosent['acto'].kind_of?(Array)
                datosent['acto'].each do |ac|
                  actocol = Sivel2Gen::Actocolectivo.new
                  actocol.caso_id = self.id
                  datosactos = [idsvcol, ac]
                  actocol.importa(datosactos, datossal, menserror, opciones)
                end
              else
                actocol = Sivel2Gen::Actocolectivo.new
                actocol.caso_id = self.id
                datosactos = [idsvcol, datosent['acto']]
                actocol.importa(datosactos, datossal, menserror, opciones)
              end
            end
            return self
          end


          def presenta(atr)
            case atr.to_s
            when 'fuentesfrecuentes'
              caso_fuenteprensa.inject('') { 
                |memo, cf| 
                r = (memo == '' ? '' : memo + ".   ")
                r += cf.fuenteprensa.nombre 
                if cf.clasificacion
                  r += ' - ' + cf.clasificacion 
                end
                if cf.ubicacion
                  r += ' - ' + cf.ubicacion
                end
                if cf.ubicacionfisica
                  r += ' - ' + cf.ubicacionfisica
                end
                r += ' - ' + cf.fecha_localizada
              }

            when 'caso_id'
              self.id
 
            when 'otrasfuentes'
              caso_fotra.inject('') { 
                |memo, of| 
                r = (memo == '' ? '' : memo + ".   ")
                r += of.nombre 
                if of.anotacion
                  r += ' - ' + of.anotacion
                end
                if of.tfuente
                  r += ' - ' + of.tfuente
                end
                if of.ubicacionfisica
                  r += ' - ' + of.ubicacionfisica
                end
                r += ' - ' + of.fecha_localizada
              }
 
            when 'presponsables'
              caso_presponsable.inject('') { 
                |memo, pr| 
                r = ''
                if pr 
                  r = (memo == '' ? '' : memo + ".   ")
                  r += pr.presponsable.nombre 
                  sigp = ' ('
                  if pr.bloque
                    r += sigp + pr.bloque
                    sigp = ', '
                  end
                  if pr.frente
                    r += sigp + pr.frente
                    sigp = ', '
                  end
                  if pr.subdivision
                    r += sigp + pr.subdivision
                    sigp = ', '
                  end
                  if pr.otro
                    r += sigp + pr.otro
                    sigp = ', '
                  end
                  r += sigp == ', ' ? ')' : ''
                  if pr.categoria && pr.categoria.count > 0
                    r += ' '
                    r += pr.categoria.inject('') { |memo, c|
                      (memo == '' ? '' : memo + ', ') + 
                        c.supracategoria.tviolencia_id + c.id.to_s
                    }
                  end
                end
                r
              }
 
            when 'ubicaciones'
              return '' if ubicacion.nil?
              ubicacion.inject("") { 
                |memo, u| 
                r = (memo == '' ? '' : memo + '.   ')
                if u.tsitio
                  r += 'Tip. Ub.: ' + u.tsitio.nombre + '; '
                end
                r += Msip::UbicacionHelper.formato_ubicacion(u, true, false) 
                if u.lugar
                  r += '; ' + u.lugar
                end
                if u.sitio
                  r += '; ' + u.sitio
                end
                if u.latitud && u.longitud
                  r += "; (" + u.latitud.to_s + ", " + u.longitud.to_s + ")"
                end
                r
              }

            when 'victimas'
              victima.inject('') { 
                |memo, v| 
                r = (memo == '' ? '' : memo + ".   ")
                r += v.persona.presenta_nombre
                if v.persona.tdocumento
                  r += ' - ' + v.persona.tdocumento.sigla
                end
                if v.persona.numerodocumento
                  r += ' ' + v.persona.numerodocumento
                end
                if v.persona.anionac || v.persona.mesnac || v.persona.dianac
                  r += ' - ' + (v.persona.anionac ? v.persona.anionac.to_s : '') +
                    '-' + (v.persona.mesnac ? v.persona.mesnac.to_s : '') + 
                    '-' + (v.persona.dianac ? v.persona.dianac.to_s : '')
                end
                if v.persona.sexo
                  r += ' - ' + v.persona.sexo
                end
                if v.persona.pais_id 
                  r += ' - ' + Msip::UbicacionHelper.formato_ubicacion_partes(
                    v.persona.pais_id, v.persona.departamento_id,
                    v.persona.municipio_id, v.persona.centropoblado_id, true, true)
                end
                if v.profesion
                  r += ' - ' + v.profesion.presenta_nombre
                end
                if v.filiacion
                  r += ' - ' + v.filiacion.presenta_nombre
                end
                if v.sectorsocial
                  r += ' - ' + v.sectorsocial.presenta_nombre
                end
                if v.organizacion
                  r += ' - ' + v.organizacion.presenta_nombre
                end
                if v.vinculoestado
                  r += ' - ' + v.vinculoestado.presenta_nombre
                end
                if v.presponsable
                  r += ' - ' + v.presponsable.presenta_nombre
                end
                if v.vinculoestado
                  r += ' - ' + v.vinculoestado.presenta_nombre
                end
                if v.persona.etnia
                  r += ' - ' + v.persona.etnia.presenta_nombre
                end
                if v.iglesia
                  r += ' - ' + v.iglesia.presenta_nombre
                end
                if v.orientacionsexual
                  r += ' - ' + v.orientacionsexual
                end
                if v.anotaciones
                  r += ' - ' + v.anotaciones
                end
                if v.antecedente
                  r += ' - ' + v.antecedente.map(&:presenta_nombre).join(', ')
                end
              }
 
            when 'victimascolectivas'
              victimacolectiva.inject('') { 
                |memo, vc| 
                r = (memo == '' ? '' : memo + ".   ")
                r += vc.grupoper.presenta_nombre
                if vc.grupoper.anotaciones
                  r += ' - ' + vc.grupoper.anotaciones
                end
                if vc.personasaprox
                  r += ' - ' + vc.personasaprox.to_s
                end
                if vc.presponsable
                  r += ' - ' + vc.presponsable.presenta_nombre
                end
                if vc.rangoedad
                  r += ' - ' + vc.rangoedad.map(&:rango).join(', ')
                end
                if vc.filiacion
                  r += ' - ' + vc.filiacion.map(&:presenta_nombre).join(', ')
                end
                if vc.organizacion
                  r += ' - ' + vc.organizacion.map(&:presenta_nombre).join(', ')
                end
                if vc.sectorsocial
                  r += ' - ' + vc.sectorsocial.map(&:presenta_nombre).join(', ')
                end
                if vc.profesion
                  r += ' - ' + vc.profesion.map(&:presenta_nombre).join(', ')
                end
                if vc.vinculoestado
                  r += ' - ' + vc.vinculoestado.map(&:presenta_nombre).join(', ')
                end
                r
              }
 
            when 'combatientes'
              combatiente.inject('') { 
                |memo, co| 
                r = (memo == '' ? '' : memo + ".   ")
                r += co.nombre
                if co.alias
                  r += ' - ' + co.alias
                end
                if co.edad
                  r += ' - ' + co.edad.to_s
                end
                if co.sexo
                  r += ' - ' + co.sexo
                end
                if co.rangoedad
                  r += ' - ' + co.rangoedad.rango
                end
                if co.sectorsocial
                  r += ' - ' + co.sectorsocial.nombre
                end
                if co.vinculoestado
                  r += ' - ' + co.vinculoestado.nombre
                end
                if co.filiacion
                  r += ' - ' + co.filiacion.nombre
                end
                if co.organizacion
                  r += ' - ' + co.organizacion.nombre
                end
                if co.presponsable
                  r += ' - ' + co.presponsable.nombre
                end
                if co.resagresion
                  r += ' - ' + co.resagresion.nombre
                end
                if co.antecedente
                  r += ' - ' + co.antecedente.map(&:presenta_nombre).join(', ')
                end
                r
              }
 
            when 'actos'
              ac = acto.inject('') { 
                |memo, a| 
                r = (memo == '' ? '' : memo + '; ')
                r += a.presponsable.nombre
                r += " : " + a.categoria.supracategoria.tviolencia_id + 
                  a.categoria.id.to_s
                r += " : " + a.persona.presenta_nombre
                r
              }
              sep = ''
              if ac != ''
                ac = "Individuales: #{ac}"
                sep = '. '
              end
              col = actocolectivo.inject('') { 
                |memo, a| 
                r = (memo == '' ? '' : memo + '; ')
                r += a.presponsable.nombre
                r += " : " + a.categoria.supracategoria.tviolencia_id + 
                  a.categoria.id.to_s
                r += " : " + a.grupoper.presenta_nombre
                r
              }
              if col != ''
                col = "Colectivos: #{col}"
              end
              ac += sep + col
              ac
 
            when 'etiquetas'
              caso_etiqueta.inject('') { 
                |memo, ce| 
                r = (memo == '' ? '' : memo + '.   ')
                r += ce.etiqueta.nombre
                r += ' - ' + ce.usuario.nusuario if ce.usuario
                r += ' - ' + ce.fecha_localizada if ce.fecha_localizada
                r += ' - ' + ce.observaciones if ce.observaciones
                r
              }
 
            when 'tipificacion'
              ac = acto.map {|a|
                a.categoria.supracategoria.tviolencia_id + 
                  a.categoria.id.to_s + ' ' +
                  a.categoria.nombre
              }.uniq.join('; ')
              sep = ''
              if ac.length > 0
                sep = '. '
              end
              col = actocolectivo.map {|a| 
                a.categoria.supracategoria.tviolencia_id + 
                  a.categoria.id.to_s + ' ' +
                  a.categoria.nombre
              }.uniq.join('; ')
              ac += sep + col
              ac

            else
              presenta_gen(atr)
            end
          end

        end

        module ClassMethods


        end


      end
    end
  end
end
