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

    scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^fecha/
        order("sivel2_gen_conscaso.fecha #{ direction }")
      when /^name_/
        order("LOWER(students.last_name) #{ direction }, LOWER(students.first_name) #{ direction }")
      when /^country_name_/
        # This sorts by a student's country name, so we need to include
        # the country. We can't use JOIN since not all students might have
        # a country.
        order("LOWER(countries.name) #{ direction }").includes(:country)
      else
        raise(ArgumentError, "Ordenamiento invalido: #{ sort_option.inspect }")
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
      where('sivel2_gen_conscaso.memo LIKE \'%' + 
            ActiveRecord::Base.connection.quote_string(d) + '%\'')
    }

    scope :filtro_nombre, lambda { |d|
      where('sip_persona.nombre LIKE \'%' + 
            ActiveRecord::Base.connection.quote_string(d) + '%\'').
      joins(:persona)
    }

    scope :filtro_codigo, lambda { |c|
      where('sivel2_gen_conscaso.id_caso = ?', c)
    }






  end
end
