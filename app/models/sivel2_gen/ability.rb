# encoding: UTF-8
module Sivel2Gen
  class Ability
    include CanCan::Ability

    ROLADMIN  = 1
    #ROLINV    = 2
    #ROLDIR    = 3
    #ROLCOOR   = 4
    ROLANALI  = 5
    #ROLSIST   = 6

    ROLES = [
      ["Administrador", ROLADMIN],  # 1
      ["", 0], # 2
      ["", 0], # 3
      ["", 0], # 4
      ["Analista", ROLANALI], # 5
      ["", 0] #6
    ]

    @@tablasbasicas = [
      ['Sivel2Gen', 'actividadarea'], ['Sivel2Gen', 'actividadoficio'],  
      ['Sivel2Gen', 'categoria'], ['Sivel2Gen', 'clase'], 
      ['Sivel2Gen', 'departamento'], 
      ['Sivel2Gen', 'escolaridad'], ['Sivel2Gen', 'etiqueta'], 
      ['Sivel2Gen', 'etnia'], 
      ['Sivel2Gen', 'filiacion'], ['Sivel2Gen', 'frontera'],
      ['Sivel2Gen', 'iglesia'], ['Sivel2Gen', 'intervalo'],
      ['Sivel2Gen', 'municipio'], 
      ['Sivel2Gen', 'organizacion'],
      ['Sivel2Gen', 'pais'], ['Sivel2Gen', 'pconsolidado'], 
      ['Sivel2Gen', 'presponsable'], ['Sivel2Gen', 'profesion'], 
      ['Sivel2Gen', 'rangoedad'], ['Sivel2Gen', 'rangoedadac'], 
      ['Sivel2Gen', 'regimensalud'],
      ['Sivel2Gen', 'regionsjr'],
      ['Sivel2Gen', 'sectorsocial'], ['Sivel2Gen', 'supracategoria'], 
      ['Sivel2Gen', 'vinculoestado'], 
      ['Sivel2Gen', 'tclase'], ['Sivel2Gen', 'tdocumento'], 
      ['Sivel2Gen', 'tsitio'], ['Sivel2Gen', 'tviolencia']
    ]

    def self.tablasbasicas
      @@tablasbasicas
    end

    # Tablas basicas cuya secuencia es de la forma tabla_id_seq  (convención rails)
    @@basicas_seq_con_id = [ 
      ['Sivel2Gen', 'actividadarea'], 
      ['Sivel2Gen', 'pais'], ['Sivel2Gen', 'rangoedadac'], 
      ['Sivel2Gen', 'tdocumento'] 
    ]

    def self.basicas_seq_con_id
      @@basicas_seq_con_id
    end

    # Tablas básicas cuyo id no es autoincremental
    @@basicas_id_noauto = [ 
      ['Sivel2Gen', 'categoria'], ['Sivel2Gen', 'clase'], 
      ['Sivel2Gen', 'departamento'], ['Sivel2Gen', 'municipio'], 
      ['Sivel2Gen', 'supracategoria'], ['Sivel2Gen', 'tclase'], 
      ['Sivel2Gen', 'tviolencia'] 
    ]

    def self.basicas_id_noauto
      @@basicas_id_noauto
    end

    # Tablas no básicas pero que tienen índice
    @@nobasicas_indice = [
      ['Sivel2Gen', 'caso'], ['Sivel2Gen', 'persona'], 
      ['Sivel2Gen', 'ubicacion'], ['', 'usuario']
    ]

    def self.nobasicas_indice
      @@nobasicas_indice
    end

    # Tablas básicas que deben volcarse primero --por ser requeridas 
    # por otras básicas
    @@tablasbasicas_prio = [
      ['Sivel2Gen', 'pconsolidado'], ['Sivel2Gen', 'tviolencia'], 
      ['Sivel2Gen', 'supracategoria'],
      ['Sivel2Gen', 'tclase'], ['Sivel2Gen', 'pais'], 
      ['Sivel2Gen', 'departamento'], ['Sivel2Gen', 'municipio'], 
      ['Sivel2Gen', 'clase'],
      ['Sivel2Gen', 'intervalo'], ['Sivel2Gen', 'filiacion'], 
      ['Sivel2Gen', 'organizacion'], ['Sivel2Gen', 'sectorsocial'],
      ['Sivel2Gen', 'vinculoestado'], ['Sivel2Gen', 'regimensalud']
    ];

    def self.tablasbasicas_prio
      @@tablasbasicas_prio
    end

    # Recibe una tabla básica como pareja [Modulo, clase] y retorna
    # clase completa Modulo::Clase
    def self.tb_clase(t)
      if (t[0] != '') 
        k = t[0] + '::' + t[1].capitalize
      else
        k = t[1].capitalize
      end
      k.constantize 
    end

    # Recibe una tabla básica como pareja [Modulo, clase] y retorna
    # nombre de tabla modulo_clase
    def self.tb_modelo(t)
      if (t[0] != '') 
        t[0].underscore.gsub(/\//, '_') + '_' + t[1]
      else 
        t[1]
      end
    end


    # Se definen habilidades con cancan
    def initialize(usuario)
      # El primer argumento para can es la acción a la que se da permiso, 
      # el segundo es el recurso sobre el que puede realizar la acción, 
      # el tercero opcional es un diccionario de condiciones para filtrar 
      # más (e.g :publicado => true).
      #
      # El primer argumento puede ser :manage para indicar toda acción, 
      # o grupos de acciones como :read (incluye :show e :index), 
      # :create, :update y :destroy.
      #
      # Si como segundo argumento usa :all se aplica a todo recurso, 
      # o puede ser una clase.
      # 
      # Detalles en el wiki de cancan: 
      #   https://github.com/ryanb/cancan/wiki/Defining-Abilities
      if !usuario || usuario.fechadeshabilitacion
        return
      end
      can :contar, Sivel2Gen::Caso
      can :buscar, Sivel2Gen::Caso
      can :lista, Sivel2Gen::Caso
      can :descarga_anexo, Sivel2Gen::Anexo
      can :descarga_anexoactividad, Sivel2Gen::Anexoactividad
      can :nuevo, Sivel2Gen::Ubicacion
      can :nuevo, Sivel2Gen::Presponsable
      can :nuevo, Sivel2Gen::Victima
      if usuario && usuario.rol then
        case usuario.rol 
        when Ability::ROLANALI
          can :read, Sivel2Gen::Caso
          can :new, Sivel2Gen::Caso
          can [:update, :create, :destroy], Sivel2Gen::Caso
          can :read, Sivel2Gen::Actividad
          can :new, Sivel2Gen::Actividad
          can [:update, :create, :destroy], Sivel2Gen::Actividad
        when Ability::ROLADMIN
          can :manage, Sivel2Gen::Caso
          can :manage, Sivel2Gen::Actividad
          can :manage, Usuario
          can :manage, :tablasbasicas
          @@tablasbasicas.each do |t|
            c = t[0] + '::' + t[1].capitalize
            c = c.constantize
            can :manage, c
          end
        end
      end
    end
  end
end
