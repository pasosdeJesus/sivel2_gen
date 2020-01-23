# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Conscaso 
        extend ActiveSupport::Concern

        included do
          belongs_to :caso, class_name: 'Sivel2Gen::Caso'

          has_many :ubicacion, through: :caso,
            class_name: 'Sip::Ubicacion'

          has_many :caso_presponsable, through: :caso,
            class_name: 'Sivel2Gen::CasoPresponsable'

          has_many :acto, through: :caso,
            class_name: 'Sivel2Gen::Acto'

          has_many :victima, through: :caso,
            class_name: 'Sivel2Gen::Victima'

          has_many :persona, through: :victima,
            class_name: 'Sip::Persona'

          has_many :caso_etiqueta, through: :caso,
            class_name: 'Sivel2Gen::CasoEtiqueta'

          has_many :caso_usuario, through: :caso,
            class_name: 'Sivel2Gen::CasoUsuario'


          scope :ordenar_por, lambda { |campo|
            # extract the sort direction from the param value.
            # direction = (campo =~ /desc$/) ? 'desc' : 'asc'
            critord = self.interpreta_ordenar_por(campo.to_s)
            order(critord)
          }

          scope :filtro_departamento_id, lambda { |id|
            where('caso_id IN (SELECT id_caso
                    FROM public.sip_ubicacion
                    WHERE sip_ubicacion.id_departamento = ?)', id)
          }

          scope :filtro_municipio_id, lambda { |id|
            where('caso_id IN (SELECT id_caso
                    FROM public.sip_ubicacion
                    WHERE sip_ubicacion.id_municipio = ?)', id)
          }

          scope :filtro_clase_id, lambda { |id|
            where('caso_id IN (SELECT id_caso
                    FROM public.sip_ubicacion
                    WHERE sip_ubicacion.id_clase = ?)', id)
          }

          scope :filtro_fechaini, lambda { |fecha_ref|
            where('sivel2_gen_conscaso.fecha >= ?', 
                  Sip::FormatoFechaHelper.
                  fecha_local_estandar(fecha_ref)
                 )
          }

          scope :filtro_fechafin, lambda { |fecha_ref|
            where('sivel2_gen_conscaso.fecha <= ?', 
                   Sip::FormatoFechaHelper.
                  fecha_local_estandar(fecha_ref)
                 )
          }

          scope :filtro_presponsable_id, lambda { |id|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_caso_presponsable
                    WHERE sivel2_gen_caso_presponsable.id_presponsable = ?)', 
                    id)
          }

          scope :filtro_categoria_id, lambda { |id|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_acto 
                    WHERE sivel2_gen_acto.id_categoria IN (?))', 
                    id)
          }

          scope :filtro_descripcion, lambda { |d|
            where('sivel2_gen_conscaso.memo ILIKE \'%' + 
                  ActiveRecord::Base.connection.quote_string(d) + '%\'')
          }

          scope :filtro_nombres, lambda { |d|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.sip_persona
                    ON sivel2_gen_victima.id_persona=sip_persona.id
                    WHERE sip_persona.nombres ILIKE \'%' + 
                    ActiveRecord::Base.connection.quote_string(d) + '%\')')
          }

          scope :filtro_apellidos, lambda { |d|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.sip_persona
                    ON sivel2_gen_victima.id_persona=sip_persona.id
                    WHERE sip_persona.apellidos ILIKE \'%' + 
                    ActiveRecord::Base.connection.quote_string(d) + '%\')')
          }

          scope :filtro_sexo, lambda { |s|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.sip_persona
                    ON sivel2_gen_victima.id_persona=sip_persona.id
                    WHERE sip_persona.sexo=?)', s)
          }

          scope :filtro_rangoedad_id, lambda { |r|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_victima 
                    WHERE sivel2_gen_victima.id_rangoedad = ?)', r)
          }

          scope :filtro_etiqueta, lambda { |c, e|
            if c 
              where('caso_id IN (SELECT id_caso 
                FROM public.sivel2_gen_caso_etiqueta
                WHERE id_etiqueta = ?)', e)
            else
              where('caso_id NOT IN (SELECT id_caso 
                FROM public.sivel2_gen_caso_etiqueta
                WHERE id_etiqueta = ?)', e)
            end
          }

          scope :filtro_usuario_id, lambda { |u|
            where('caso_id IN (SELECT id_caso
                    FROM public.sivel2_gen_caso_usuario
                    WHERE sivel2_gen_caso_usuario.id_usuario = ?)', u)
          }

          scope :filtro_fechaingini, lambda { |f|
            where('caso_id IN (SELECT id
                    FROM public.sivel2_gen_caso
                    WHERE created_at >= ?)', 
                  Sip::FormatoFechaHelper.fecha_local_estandar(f)
                 )
          }

          scope :filtro_fechaingfin, lambda { |f|
            where('caso_id IN (SELECT id FROM public.sivel2_gen_caso
              WHERE created_at <= ?)',
              Sip::FormatoFechaHelper.fecha_local_estandar(f)
                 )

          }

          scope :filtro_codigo, lambda { |c|
            where(caso_id: c.split(' '))
          }

        end

        module ClassMethods

          def refresca_conscaso
            if ARGV.include?("db:migrate")
              return
            end
            if !ActiveRecord::Base.connection.data_source_exists? 'sivel2_gen_conscaso'
              ActiveRecord::Base.connection.execute("CREATE OR REPLACE 
        VIEW sivel2_gen_conscaso1 AS
        SELECT caso.id as caso_id, caso.fecha, caso.memo, 
        ARRAY_TO_STRING(ARRAY(SELECT COALESCE(departamento.nombre, '') ||  
        ' / ' || COALESCE(municipio.nombre, '')
        FROM public.sip_ubicacion AS ubicacion 
					LEFT JOIN public.sip_departamento AS departamento 
						ON (ubicacion.id_departamento = departamento.id)
        	LEFT JOIN public.sip_municipio AS municipio 
						ON (ubicacion.id_municipio=municipio.id)
          WHERE ubicacion.id_caso=caso.id), ', ')
        AS ubicaciones, 
        ARRAY_TO_STRING(ARRAY(SELECT nombres || ' ' || apellidos 
          FROM public.sip_persona AS persona, 
          public.sivel2_gen_victima AS victima 
          WHERE persona.id=victima.id_persona 
          AND victima.id_caso=caso.id), ', ')
        AS victimas, 
        ARRAY_TO_STRING(ARRAY(SELECT nombre 
          FROM public.sivel2_gen_presponsable AS presponsable, 
          public.sivel2_gen_caso_presponsable AS caso_presponsable
          WHERE presponsable.id=caso_presponsable.id_presponsable
          AND caso_presponsable.id_caso=caso.id), ', ')
        AS presponsables, 
        ARRAY_TO_STRING(ARRAY(SELECT supracategoria.id_tviolencia || ':' || 
          categoria.supracategoria_id || ':' || categoria.id || ' ' ||
          categoria.nombre FROM public.sivel2_gen_categoria AS categoria, 
          public.sivel2_gen_supracategoria AS supracategoria,
          public.sivel2_gen_acto AS acto
          WHERE categoria.id=acto.id_categoria
          AND supracategoria.id=categoria.supracategoria_id
          AND acto.id_caso=caso.id), ', ')
        AS tipificacion
        FROM public.sivel2_gen_caso AS caso;")
              ActiveRecord::Base.connection.execute(
          "CREATE MATERIALIZED VIEW sivel2_gen_conscaso AS
        SELECT caso_id, fecha, memo, ubicaciones, victimas, 
        presponsables, tipificacion, 
        to_tsvector('spanish', unaccent(caso_id || ' ' || 
        replace(cast(fecha AS varchar), '-', ' ') 
        || ' ' || memo || ' ' || ubicaciones || ' ' || 
         victimas || ' ' || presponsables || ' ' || tipificacion)) as q
        FROM public.sivel2_gen_conscaso1");
              ActiveRecord::Base.connection.execute(
          "CREATE INDEX busca_sivel2_gen_conscaso 
							ON sivel2_gen_conscaso USING gin(q);"
        )
            else
              ActiveRecord::Base.connection.execute(
                'REFRESH MATERIALIZED VIEW sivel2_gen_conscaso'
              )
            end
          end # def refresca_conscaso

          def interpreta_ordenar_por(campo)
            critord = ""
            case campo.to_s
            when /^fechadesc/
              critord = "sivel2_gen_conscaso.fecha desc"
            when /^fecha/
              critord = "sivel2_gen_conscaso.fecha asc"
            when /^ubicaciondesc/
              critord = "sivel2_gen_conscaso.ubicaciones desc"
            when /^ubicacion/
              critord = "sivel2_gen_conscaso.ubicaciones asc"
            when /^codigodesc/
              critord = "sivel2_gen_conscaso.caso_id desc"
            when /^codigo/
              critord = "sivel2_gen_conscaso.caso_id asc"
            else
              raise(ArgumentError, "Ordenamiento invalido: #{ campo.inspect }")
            end
            critord += ", sivel2_gen_conscaso.caso_id"
            return critord
          end

        end # module ClassMethods

      end
    end
  end
end
