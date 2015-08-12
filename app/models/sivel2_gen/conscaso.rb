# encoding: UTF-8
module Sivel2Gen
  class Conscaso < ActiveRecord::Base
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
      direction = (campo =~ /desc$/) ? 'desc' : 'asc'
      case campo.to_s
      when /^fechadesc/
        order("sivel2_gen_conscaso.fecha desc")
      when /^fecha/
        order("sivel2_gen_conscaso.fecha asc")
      when /^ubicaciondesc/
        order("sivel2_gen_conscaso.ubicaciones desc")
      when /^ubicacion/
        order("sivel2_gen_conscaso.ubicaciones asc")
      when /^codigodesc/
        order("sivel2_gen_conscaso.caso_id desc")
      when /^codigo/
        order("sivel2_gen_conscaso.caso_id asc")
      else
        raise(ArgumentError, "Ordenamiento invalido: #{ campo.inspect }")
      end
    }

    scope :filtro_departamento_id, lambda { |id|
      where('sip_ubicacion.id_departamento = ?', id).
        joins(:ubicacion)
    }

    scope :filtro_municipio_id, lambda { |id|
      where('sip_ubicacion.id_municipio = ?', id).
        joins(:ubicacion)
    }

    scope :filtro_clase_id, lambda { |id|
      where('sip_ubicacion.id_clase = ?', id).
        joins(:ubicacion)
    }

    scope :filtro_fechaini, lambda { |fecha_ref|
      where('sivel2_gen_conscaso.fecha >= ?', fecha_ref)
    }

    scope :filtro_fechafin, lambda { |fecha_ref|
      where('sivel2_gen_conscaso.fecha <= ?', fecha_ref)
    }

    scope :filtro_presponsable_id, lambda { |id|
      where('sivel2_gen_caso_presponsable.id_presponsable = ?', id).
        joins(:caso_presponsable)
    }

    scope :filtro_categoria_id, lambda { |id|
      where('sivel2_gen_acto.id_categoria = ?', id).
        joins(:acto)
    }

    scope :filtro_descripcion, lambda { |d|
      where('sivel2_gen_conscaso.memo ILIKE \'%' + 
            ActiveRecord::Base.connection.quote_string(d) + '%\'')
    }

    scope :filtro_nombres, lambda { |d|
      where('sip_persona.nombres ILIKE \'%' + 
            ActiveRecord::Base.connection.quote_string(d) + '%\'').
      joins(:persona)
    }

    scope :filtro_apellidos, lambda { |d|
      where('sip_persona.apellidos ILIKE \'%' + 
            ActiveRecord::Base.connection.quote_string(d) + '%\'').
      joins(:persona)
    }

    scope :filtro_sexo, lambda { |s|
      where('sip_persona.sexo = ?', s).
      joins(:persona)
    }

    scope :filtro_rangoedad_id, lambda { |r|
      where('sivel2_gen_victima.id_rangoedad= ?', r).
      joins(:victima)
    }

    scope :filtro_etiqueta, lambda { |c, e|
      if c 
        where('caso_id IN (SELECT id_caso 
                FROM sivel2_gen_caso_etiqueta
                WHERE id_etiqueta = ?)', e)
      else
        where('caso_id NOT IN (SELECT id_caso 
                FROM sivel2_gen_caso_etiqueta
                WHERE id_etiqueta = ?)', e)
      end
    }

    scope :filtro_usuario_id, lambda { |u|
      where('sivel2_gen_caso_usuario.id_usuario = ?', u).
        joins(:caso_usuario)
    }

    scope :filtro_fechaingini, lambda { |f|
      where('sivel2_gen_caso_usuario.fechainicio >= ?', f).
        joins(:caso_usuario)
    }

    scope :filtro_fechaingfin, lambda { |f|
      where('sivel2_gen_caso_usuario.fechainicio <= ?', f).
        joins(:caso_usuario)
    }

    scope :filtro_codigo, lambda { |c|
      where(caso_id: c.split(' '))
    }

  end
end
