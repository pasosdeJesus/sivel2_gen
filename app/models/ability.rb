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
    'frontera',
    'iglesia', 
    'municipio', 
    'pais', 'presponsable', 'profesion', 
    'rangoedad', 'rangoedadac', 'region', 'regionsjr',
    'supracategoria', 'tclase', 'tsitio', 'tviolencia'
  ]

  def self.tablasbasicas
    @@tablasbasicas
  end

  # Tablas basicas cuya secuencia es de la forma tabla_id_seq 
  @@basicas_seq_con_id = [ "actividadarea", "pais", "rangoedadac" ]

  def self.basicas_seq_con_id
    @@basicas_seq_con_id
  end

  def initialize(usuario)
    can :contar, Caso
    can :buscar, Caso
    can :lista, Caso
    can :descarga_anexo, Anexo
    can :nuevo, Ubicacion
    can :nuevo, Presponsable
    can :nuevo, Victima
    if !usuario.nil? && !usuario.rol.nil? then
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

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
