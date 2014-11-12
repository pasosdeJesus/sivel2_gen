# encoding: UTF-8
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
    'actividadarea', 'actividadoficio',  
    'categoria', 'clase', 
    'departamento', 
    'escolaridad', 'etiqueta', 'etnia', 
    'filiacion', 'frontera',
    'iglesia', 'intervalo',
    'municipio', 
    'organizacion',
    'pais', 'pconsolidado', 'presponsable', 'profesion', 
    'rangoedad', 'rangoedadac', 'regimensalud', 'region', 'regionsjr',
    'sectorsocial', 'supracategoria', 
    'vinculoestado', 
    'tclase', 'tdocumento', 'tsitio', 'tviolencia'
  ]

  def self.tablasbasicas
    @@tablasbasicas
  end

  # Tablas basicas cuya secuencia es de la forma tabla_id_seq  (convención rails)
  @@basicas_seq_con_id = [ "actividadarea", "pais", "rangoedadac", "tdocumento" ]

  def self.basicas_seq_con_id
    @@basicas_seq_con_id
  end

  # Tablas básicas cuyo id no es autoincremental
  @@basicas_id_noauto = [ 
    "categoria", "clase", "departamento", "municipio", 
    "supracategoria", "tclase", "tviolencia" 
  ]

  def self.basicas_id_noauto
    @@basicas_id_noauto
  end

  # Tablas no básicas pero que tienen índice
  @@nobasicas_indice = ['caso', 'persona', 'ubicacion', 'usuario']

  def self.nobasicas_indice
    @@nobasicas_indice
  end

  # Tablas básicas que deben volcarse primero --por ser requeridas 
  # por otras básicas
  @@tablasbasicas_prio = [
    "pconsolidado", "tviolencia", "supracategoria",
    "tclase", "pais", "departamento", "municipio", "clase",
    "intervalo", "filiacion", "organizacion", "sectorsocial",
    "vinculoestado", "regimensalud"
  ];

  def self.tablasbasicas_prio
    @@tablasbasicas_prio
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
    can :contar, Caso
    can :buscar, Caso
    can :lista, Caso
    can :descarga_anexo, Anexo
    can :descarga_anexoactividad, Anexoactividad
    can :nuevo, Ubicacion
    can :nuevo, Presponsable
    can :nuevo, Victima
    if usuario && usuario.rol then
      case usuario.rol 
      when Ability::ROLANALI
        can :read, Caso
        can :new, Caso
        can [:update, :create, :destroy], Caso
        can :read, Actividad
        can :new, Actividad
        can [:update, :create, :destroy], Actividad
      when Ability::ROLADMIN
        can :manage, Caso
        can :manage, Actividad
        can :manage, Usuario
        can :manage, :tablasbasicas
        @@tablasbasicas.each do |t|
          c = t.capitalize.constantize
          can :manage, c
        end
      end
    end
  end
end

