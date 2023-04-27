
module Sivel2Gen
  module Concerns
    module Models
      module Conscaso 
        extend ActiveSupport::Concern

        included do
          belongs_to :caso, class_name: 'Sivel2Gen::Caso', optional: false

          has_many :ubicacion, through: :caso,
            class_name: 'Msip::Ubicacion'

          has_many :caso_presponsable, through: :caso,
            class_name: 'Sivel2Gen::CasoPresponsable'

          has_many :acto, through: :caso,
            class_name: 'Sivel2Gen::Acto'

          has_many :victima, through: :caso,
            class_name: 'Sivel2Gen::Victima'

          has_many :persona, through: :victima,
            class_name: 'Msip::Persona'

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
            where('caso_id IN (SELECT caso_id
                    FROM public.msip_ubicacion
                    WHERE msip_ubicacion.departamento_id = ?)', id)
          }

          scope :filtro_municipio_id, lambda { |id|
            where('caso_id IN (SELECT caso_id
                    FROM public.msip_ubicacion
                    WHERE msip_ubicacion.municipio_id = ?)', id)
          }

          scope :filtro_clase_id, lambda { |id|
            where('caso_id IN (SELECT caso_id
                    FROM public.msip_ubicacion
                    WHERE msip_ubicacion.clase_id = ?)', id)
          }

          scope :filtro_fechaini, lambda { |fecha_ref|
            where('sivel2_gen_conscaso.fecha >= ?', 
                  Msip::FormatoFechaHelper.
                  fecha_local_estandar(fecha_ref)
                 )
          }

          scope :filtro_fechafin, lambda { |fecha_ref|
            where('sivel2_gen_conscaso.fecha <= ?', 
                   Msip::FormatoFechaHelper.
                  fecha_local_estandar(fecha_ref)
                 )
          }

          scope :filtro_presponsable_id, lambda { |id|
            id.delete("")
            if id.is_a? Array
              id = id.map {|item| item.to_i}
              where('caso_id IN (SELECT caso_id
                      FROM public.sivel2_gen_caso_presponsable
                      WHERE sivel2_gen_caso_presponsable.presponsable_id IN (?))',
                      id)
            else
              where('caso_id IN (SELECT caso_id
                      FROM public.sivel2_gen_caso_presponsable
                      WHERE sivel2_gen_caso_presponsable.presponsable_id = ?)',
                      id)
            end
          }

          scope :filtro_categoria_id, lambda { |id|
            if id.is_a? Array
              where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_acto
                    WHERE sivel2_gen_acto.categoria_id IN (?)) OR
                    caso_id IN (
                    SELECT caso_id FROM public.sivel2_gen_caso_presponsable
                    INNER JOIN public.sivel2_gen_caso_categoria_presponsable ON
                     public.sivel2_gen_caso_presponsable.id =
                    public.sivel2_gen_caso_categoria_presponsable.caso_presponsable_id WHERE
                    public.sivel2_gen_caso_categoria_presponsable.categoria_id IN (?) 
                   )',
                    id, id)
            else
              where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_acto
                    WHERE sivel2_gen_acto.categoria_id = ?) OR
                    caso_id IN (
                    SELECT caso_id FROM public.sivel2_gen_caso_presponsable
                    INNER JOIN public.sivel2_gen_caso_categoria_presponsable ON
                     public.sivel2_gen_caso_presponsable.id =
                    public.sivel2_gen_caso_categoria_presponsable.caso_presponsable_id WHERE
                    public.sivel2_gen_caso_categoria_presponsable.categoria_id = ? 
                   )',
                    id, id)

            end
          }

          scope :filtro_contexto_id, lambda { |idc|
            where('caso_id IN (SELECT caso_id
                  FROM public.sivel2_gen_caso_contexto
                  WHERE sivel2_gen_caso_contexto.contexto_id IN (?))',
                  idc)
          }
          
          scope :filtro_contextovictima_id, lambda { |idc|
            where('caso_id IN (SELECT caso_id
                  FROM public.sivel2_gen_victima INNER JOIN
                  public.sivel2_gen_contextovictima_victima ON
                  public.sivel2_gen_victima.id = public.sivel2_gen_contextovictima_victima.victima_id WHERE sivel2_gen_contextovictima_victima.contextovictima_id IN (?))',
                  idc)
          }

          scope :filtro_descripcion, lambda { |d|
            where("unaccent(sivel2_gen_conscaso.memo) ILIKE '%'
                  || unaccent(?) || '%'", d)
          }

          scope :filtro_apellidos, lambda { |d|
            where("caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.msip_persona
                    ON sivel2_gen_victima.persona_id=msip_persona.id
                    WHERE unaccent(msip_persona.apellidos) ILIKE '%' ||
                      unaccent(?) || '%')", d)
          }

          scope :filtro_nombres, lambda { |d|
            where("caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.msip_persona
                    ON sivel2_gen_victima.persona_id=msip_persona.id
                    WHERE unaccent(msip_persona.nombres) ILIKE '%' ||
                      unaccent(?) || '%')", d)
          }

          scope :filtro_victimacol, lambda { |d|
            where("caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victimacolectiva 
                    INNER JOIN public.msip_grupoper
                    ON sivel2_gen_victimacolectiva.grupoper_id=msip_grupoper.id
                    WHERE unaccent(msip_grupoper.nombre) ILIKE '%' ||
                      unaccent(?) || '%')", d)
          }

          scope :filtro_sexo, lambda { |s|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.msip_persona
                    ON sivel2_gen_victima.persona_id=msip_persona.id
                    WHERE msip_persona.sexo=?)', s)
          }

          scope :filtro_orientacionsexual, lambda { |s|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    WHERE orientacionsexual=?)', s)
          }

          scope :filtro_rangoedad_id, lambda { |r|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    WHERE sivel2_gen_victima.rangoedad_id = ?)', r)
          }

          scope :filtro_sectorsocial_id, lambda { |r|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima
                    WHERE sivel2_gen_victima.sectorsocial_id = ? UNION 
                    SELECT caso_id FROM public.sivel2_gen_victima 
                    INNER JOIN public.sivel2_gen_sectorsocialsec_victima ON sivel2_gen_victima.id = sivel2_gen_sectorsocialsec_victima.victima_id 
                    WHERE sivel2_gen_sectorsocialsec_victima.sectorsocial_id = ?)', r, r)
          }

          scope :filtro_organizacion_id, lambda { |r|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima
                    WHERE sivel2_gen_victima.organizacion_id = ? UNION 
                    SELECT caso_id FROM public.sivel2_gen_victima 
                    INNER JOIN public.sivel2_gen_otraorga_victima ON sivel2_gen_victima.id = sivel2_gen_otraorga_victima.victima_id 
                    WHERE sivel2_gen_otraorga_victima.organizacion_id = ?)', r, r)
          }

          scope :filtro_profesion_id, lambda { |r|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima
                    WHERE sivel2_gen_victima.profesion_id IN (?))', r)
          }


          scope :filtro_filiacion_id, lambda { |r|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima
                    WHERE sivel2_gen_victima.filiacion_id IN (?))', r)
          }

          scope :filtro_etiqueta, lambda { |c, e|
            if c 
              where('caso_id IN (SELECT caso_id 
                FROM public.sivel2_gen_caso_etiqueta
                WHERE etiqueta_id = ?)', e)
            else
              where('caso_id NOT IN (SELECT caso_id 
                FROM public.sivel2_gen_caso_etiqueta
                WHERE etiqueta_id = ?)', e)
            end
          }

          scope :filtro_usuario_id, lambda { |u|
            where('caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_caso_usuario
                    WHERE sivel2_gen_caso_usuario.usuario_id = ?)', u)
          }

          scope :filtro_fechaingini, lambda { |f|
            where('caso_id IN (SELECT id
                    FROM public.sivel2_gen_caso
                    WHERE created_at >= ?)', 
                  Msip::FormatoFechaHelper.fecha_local_estandar(f)
                 )
          }

          scope :filtro_fechaingfin, lambda { |f|
            where('caso_id IN (SELECT id FROM public.sivel2_gen_caso
              WHERE created_at <= ?)',
              Msip::FormatoFechaHelper.fecha_local_estandar(f)
                 )

          }

          scope :filtro_codigo, lambda { |c|
            where(caso_id: c.split(' '))
          }

        end

        module ClassMethods

          def consulta_base_sivel2_gen
            "SELECT caso.id as caso_id, caso.fecha, caso.memo, 
        ARRAY_TO_STRING(ARRAY(SELECT COALESCE(departamento.nombre, '') ||  
        ' / ' || COALESCE(municipio.nombre, '')
        FROM public.msip_ubicacion AS ubicacion 
          LEFT JOIN public.msip_departamento AS departamento 
            ON (ubicacion.departamento_id = departamento.id)
          LEFT JOIN public.msip_municipio AS municipio 
            ON (ubicacion.municipio_id=municipio.id)
          WHERE ubicacion.caso_id=caso.id), ', ')
        AS ubicaciones, 
        ARRAY_TO_STRING(ARRAY(SELECT nombres || ' ' || apellidos 
          FROM public.msip_persona AS persona, 
          public.sivel2_gen_victima AS victima 
          WHERE persona.id=victima.persona_id 
          AND victima.caso_id=caso.id), ', ')
        AS victimas, 
        ARRAY_TO_STRING(ARRAY(SELECT nombre 
          FROM public.sivel2_gen_presponsable AS presponsable, 
          public.sivel2_gen_caso_presponsable AS caso_presponsable
          WHERE presponsable.id=caso_presponsable.presponsable_id
          AND caso_presponsable.caso_id=caso.id), ', ')
        AS presponsables, 
        ARRAY_TO_STRING(ARRAY(SELECT supracategoria.tviolencia_id || ':' || 
          categoria.supracategoria_id || ':' || categoria.id || ' ' ||
          categoria.nombre FROM public.sivel2_gen_categoria AS categoria, 
          public.sivel2_gen_supracategoria AS supracategoria,
          public.sivel2_gen_acto AS acto
          WHERE categoria.id=acto.categoria_id
          AND supracategoria.id=categoria.supracategoria_id
          AND acto.caso_id=caso.id), ', ')
        AS tipificacion
        FROM public.sivel2_gen_caso AS caso"
          end
          
          def consulta_base
            consulta_base_sivel2_gen
          end

          # Retorna '' sii puede refrescar o crear sivel2_gen_conscaso
          # en otro caso retorna cadena con problema o razón por la que
          # no refresca
          def refresca_conscaso
            if ARGV.include?("db:migrate")
              return 'Ejecutando migración'
            end
            if !ActiveRecord::Base.connection.data_source_exists? 'sivel2_gen_conscaso'
              ActiveRecord::Base.connection.execute("CREATE OR REPLACE 
        VIEW sivel2_gen_conscaso1 AS #{consulta_base};")
              ActiveRecord::Base.connection.execute(
                "CREATE MATERIALIZED VIEW sivel2_gen_conscaso AS
        SELECT caso_id, fecha, memo, ubicaciones, victimas, 
        presponsables, tipificacion, now() AS ultimo_refresco,
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
              p = Msip::ProcesosHelper.procesos_OpenBSD
              r = p.select {|u| u[:command] =~ /REFRESH/ }
              if r.count > 0
                return "Ejecución de otro(s) REFRESH en curso (#{r.map {|x| x[:command]}})"
              else
                ActiveRecord::Base.connection.execute(
                  'REFRESH MATERIALIZED VIEW sivel2_gen_conscaso'
                )
              end
            end
            return ''
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
