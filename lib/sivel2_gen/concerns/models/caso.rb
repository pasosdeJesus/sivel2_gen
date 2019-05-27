# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Caso 
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          @current_usuario = nil
          attr_accessor :current_usuario

          # Ordenados por foreign_key para facilitar comparar con esquema en base
          has_many :acto, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Acto'
          accepts_nested_attributes_for :acto, allow_destroy: true, 
            reject_if: :all_blank

          has_many :actocolectivo, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Actocolectivo'

          has_many :anexo_caso, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::AnexoCaso',
            inverse_of: :caso
          accepts_nested_attributes_for :anexo_caso, allow_destroy: true, 
            reject_if: :all_blank
          has_many :sip_anexo, :through => :anexo_caso, 
            class_name: 'Sip::Anexo'
          accepts_nested_attributes_for :sip_anexo,  reject_if: :all_blank

          has_and_belongs_to_many :antecedente, 
            class_name: 'Sivel2Gen::Antecedente',
            foreign_key: :id_caso, 
            association_foreign_key: :id_antecedente,
            join_table: 'sivel2_gen_antecedente_caso'

          has_and_belongs_to_many :contexto, 
            class_name: 'Sivel2Gen::Contexto',
            foreign_key: :id_caso, 
            association_foreign_key: :id_contexto,
            join_table: 'sivel2_gen_caso_contexto'

          has_many :caso_etiqueta, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::CasoEtiqueta'
          has_many :etiqueta, through: :caso_etiqueta, 
            class_name: 'Sip::Etiqueta'
          accepts_nested_attributes_for :caso_etiqueta, allow_destroy: true, 
            reject_if: :all_blank
          
          has_many :caso_fotra, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::CasoFotra',
            inverse_of: :caso
          accepts_nested_attributes_for :caso_fotra, allow_destroy: true, 
            reject_if: :all_blank
          has_many :fotra, through: :caso_fotra, class_name: 'Sip::Fotra'

          has_many :caso_fuenteprensa, foreign_key: "id_caso", 
            validate: true, dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoFuenteprensa', inverse_of: :caso
          accepts_nested_attributes_for :caso_fuenteprensa, 
            allow_destroy: true, reject_if: :all_blank
          has_many :fuenteprensa, through: :caso_fuenteprensa, 
            class_name: 'Sip::Fuenteprensa'

          has_and_belongs_to_many :frontera, 
            class_name: 'Sivel2Gen::Frontera',
            foreign_key: 'id_caso',
            association_foreign_key: 'id_frontera',
            join_table: 'sivel2_gen_caso_frontera'

          has_many :caso_presponsable, foreign_key: "id_caso", 
            validate: true, 
            dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoPresponsable'
          has_many :presponsable, through: :caso_presponsable, 
            class_name: 'Sivel2Gen::Presponsable'
          accepts_nested_attributes_for :caso_presponsable, 
            allow_destroy: true, reject_if: :all_blank

          has_and_belongs_to_many :region, 
            class_name: 'Sivel2Gen::Region',
            foreign_key: 'id_caso', 
            association_foreign_key: 'id_region',
            join_table: 'sivel2_gen_caso_region'

          has_many :caso_usuario, foreign_key: "id_caso", validate: true, 
            class_name: 'Sivel2Gen::CasoUsuario', dependent: :delete_all
          has_many :usuario, :through => :caso_usuario, class_name: 'Usuario'

          has_many :ubicacion, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sip::Ubicacion'
          accepts_nested_attributes_for :ubicacion, allow_destroy: true, 
            reject_if: :all_blank

          has_many :victima,  foreign_key: "id_caso", dependent: :destroy, 
            class_name: 'Sivel2Gen::Victima'
          has_many :persona, :through => :victima, class_name: 'Sip::Persona'
          accepts_nested_attributes_for :persona,  reject_if: :all_blank
          accepts_nested_attributes_for :victima, allow_destroy: true, 
            reject_if: :all_blank

          has_many :victimacolectiva, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Victimacolectiva' 
          has_many :grupoper, :through => :victimacolectiva, 
            class_name: 'Sip::Grupoper'
          accepts_nested_attributes_for :grupoper,  reject_if: :all_blank
          accepts_nested_attributes_for :victimacolectiva, 
            allow_destroy: true, 
            reject_if: :all_blank

          has_many :combatiente, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Combatiente' 
          accepts_nested_attributes_for :combatiente, allow_destroy: true, 
            reject_if: :all_blank

          has_one :sivel2_gen_conscaso, foreign_key: "caso_id"

          belongs_to :intervalo, foreign_key: "id_intervalo", 
            validate: true, class_name: 'Sivel2Gen::Intervalo', optional: true

          campofecha_localizado :fecha

          validates_presence_of :fecha
          validates :titulo, length: { maximum: 50 }
          validates :hora, length: { maximum: 10 }
          validates :duracion, length: { maximum: 10 }
          validates :grconfiabilidad, length: { maximum: 5 }
          validates :gresclarecimiento, length: { maximum: 5 }
          validates :grimpunidad, length: { maximum: 8 }
          validates :grinformacion, length: { maximum: 8 }

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
                if pr.division
                  r += sigp + pr.division
                  sigp = ', '
                end
                if pr.brigada
                  r += sigp + pr.brigada
                  sigp = ', '
                end
                if pr.batallon
                  r += sigp + pr.batallon
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
                      c.supracategoria.id_tviolencia + c.id.to_s
                  }
                end
              }
 
            when 'ubicaciones'
              return '' if ubicacion.nil?
              ubicacion.inject("") { 
                |memo, u| 
                r = (memo == '' ? '' : memo + '.   ')
                if u.tsitio
                  r += 'Tip. Ub.: ' + u.tsitio.nombre + '; '
                end
                r += Sip::UbicacionHelper.formato_ubicacion(u, true, false) 
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
                if v.persona.id_pais 
                  r += ' - ' + Sip::UbicacionHelper.formato_ubicacion_partes(
                    v.persona.id_pais, v.persona.id_departamento,
                    v.persona.id_municipio, v.persona.id_clase, true, true)
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
                if v.etnia
                  r += ' - ' + v.etnia.presenta_nombre
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
                r += " : " + a.categoria.supracategoria.id_tviolencia + 
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
                r += " : " + a.categoria.supracategoria.id_tviolencia + 
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
                r += ' - ' + ce.usuario.nusuario
                r += ' - ' + ce.fecha_localizada
                r += ' - ' + ce.observaciones
                r
              }
               
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
