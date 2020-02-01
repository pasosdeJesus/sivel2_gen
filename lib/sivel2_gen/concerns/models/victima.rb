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
          
          has_and_belongs_to_many :persona_trelacion, foreign_key: "id_persona", class_name: 'Sip::PersonaTrelacion'
          accepts_nested_attributes_for :persona_trelacion, reject_if: :all_blank
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


        end
      end
    end
  end
end

