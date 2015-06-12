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

    ROLES = Sip::Ability::ROLES

    BASICAS = Sip::Ability::TABLAS_SIP + [
      ['Sivel2Gen', 'actividadoficio'],  
      ['Sivel2Gen', 'categoria'], 
      ['Sivel2Gen', 'escolaridad'], 
      ['Sivel2Gen', 'estadocivil'], 
      ['Sivel2Gen', 'etnia'], 
      ['Sivel2Gen', 'filiacion'], 
      ['Sivel2Gen', 'frontera'],
      ['Sivel2Gen', 'iglesia'], 
      ['Sivel2Gen', 'intervalo'],
      ['Sivel2Gen', 'maternidad'], 
      ['Sivel2Gen', 'organizacion'],
      ['Sivel2Gen', 'pconsolidado'], 
      ['Sivel2Gen', 'presponsable'], 
      ['Sivel2Gen', 'profesion'], 
      ['Sivel2Gen', 'rangoedad'],
      ['Sivel2Gen', 'region'], 
      ['Sivel2Gen', 'sectorsocial'], 
      ['Sivel2Gen', 'supracategoria'], 
      ['Sivel2Gen', 'vinculoestado'], 
      ['Sivel2Gen', 'tviolencia']
    ]
    @@tablasbasicas = BASICAS
    def self.tablasbasicas
      @@tablasbasicas
    end

    # Tablas basicas cuya secuencia es de la forma tabla_id_seq  (convención rails)
    BASICAS_SEQID = Sip::Ability::TABLAS_SIP_SEQID + [ 
      ['Sivel2Gen', 'supracategoria']
    ]
    @@basicas_seq_con_id = BASICAS_SEQID
    def self.basicas_seq_con_id
      @@basicas_seq_con_id
    end

    # Tablas básicas cuyo id no es autoincremental
    @@basicas_id_noauto = Sip::Ability::TABLAS_ID_NOAUTO + [ 
      ['Sivel2Gen', 'categoria'], 
      ['Sivel2Gen', 'tviolencia'] 
    ]

    def self.basicas_id_noauto
      @@basicas_id_noauto
    end

    # Tablas no básicas pero que tienen índice
    NOBASICAS_INDICE =  [
      ['Sivel2Gen', 'caso'], 
    ]
    @@nobasicas_indice = NOBASICAS_INDICE
    def self.nobasicas_indice
      @@nobasicas_indice
    end

		# Tablas no básicas pero que tienen índice con secuencia id_seq
    @@nobasicas_indice_seq_con_id = Sip::Ability::NOBASICAS_INDSEQID

    def self.nobasicas_indice_seq_con_id
      @@nobasicas_indice_seq_con_id
    end


    # Tablas básicas que deben volcarse primero --por ser requeridas 
    # por otras básicas
    BASICAS_PRIO = Sip::Ability::BASICAS_PRIO + [
      ['Sivel2Gen', 'pconsolidado'], 
			['Sivel2Gen', 'tviolencia'], 
      ['Sivel2Gen', 'supracategoria'],
      ['Sivel2Gen', 'intervalo'], 
			['Sivel2Gen', 'filiacion'], 
      ['Sivel2Gen', 'organizacion'], 
			['Sivel2Gen', 'sectorsocial'],
      ['Sivel2Gen', 'vinculoestado']
    ];
    @@tablasbasicas_prio = BASICAS_PRIO
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
      can :nuevo, Sip::Ubicacion
      can :nuevo, Sivel2Gen::Presponsable
      can :nuevo, Sivel2Gen::Victima
      if usuario && usuario.rol then
        case usuario.rol 
        when Ability::ROLANALI
          can :read, Sivel2Gen::Caso
          can :new, Sivel2Gen::Caso
          can [:update, :create, :destroy], Sivel2Gen::Caso
          can :manage, Sivel2Gen::Acto
          can :manage, Sip::Persona
        when Ability::ROLADMIN
          can :manage, Sivel2Gen::Caso
          can :manage, Usuario
          can :manage, Sivel2Gen::Acto
          can :manage, :tablasbasicas
          @@tablasbasicas.each do |t|
            c = Ability.tb_clase(t)
            can :manage, c
          end
        end
      end
    end
  end
end
