# encoding: UTF-8

class Ability  < Sivel2Gen::Ability

  # Establece autorizaciones con CanCanCan
  def initialize(usuario = nil)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    can :contar, Sip::Ubicacion
    can :contar, Sivel2Gen::Caso
    can :buscar, Sivel2Gen::Caso
    can :lista, Sivel2Gen::Caso
    can :descarga_anexo, Sip::Anexo
    can :nuevo, Sip::Ubicacion
    can :nuevo, Sivel2Gen::Presponsable
    can :nuevo, Sivel2Gen::Victima
    can :nuevo, Sivel2Gen::Victimacolectiva
    can :nuevo, Sivel2Gen::Combatiente
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
        can :manage, Sip::Persona
        can :manage, Usuario
        can :manage, Sivel2Gen::Acto
        can :manage, Heb412Gen::Doc
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

