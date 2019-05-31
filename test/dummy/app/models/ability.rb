# encoding: UTF-8

class Ability  < Sivel2Gen::Ability

  # Establece autorizaciones con CanCanCan
  def initialize(usuario = nil)
    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    can :read, Sip::Actorsocial

    can :descarga_anexo, Sip::Anexo

    can :contar, Sip::Ubicacion
    can :nuevo, Sip::Ubicacion
   
    # La consulta web es publica dependiendo de 
    # Rails.application.config.x.sivel2_consulta_web_publica  
    can :buscar, Sivel2Gen::Caso
    can :contar, Sivel2Gen::Caso
    can :lista, Sivel2Gen::Caso

    can :nuevo, Sivel2Gen::Combatiente

    can :nuevo, Sivel2Gen::Presponsable

    can :nuevo, Sivel2Gen::Victima

    can :nuevo, Sivel2Gen::Victimacolectiva
    if usuario && usuario.rol then
      case usuario.rol 
      when Ability::ROLANALI
        can :read, Heb412Gen::Doc
        can :read, Heb412Gen::Plantilladoc
        can :read, Heb412Gen::Plantillahcm
        can :read, Heb412Gen::Plantillahcr
        
        can :manage, Sip::Persona

        can :manage, Sip::Actorsocial
        can :manage, Sip::Persona

        can :manage, Sivel2Gen::Acto
        can :manage, Sivel2Gen::Actocolectivo
        can :read, Sivel2Gen::Caso
        can :new, Sivel2Gen::Caso
        can :nuevo, Sivel2Gen::Caso
        can [:update, :create, :destroy], Sivel2Gen::Caso
        can :read, Sivel2Gen::Victima
      when Ability::ROLADMIN
        can :manage, Heb412Gen::Doc
        can :manage, Heb412Gen::Plantilladoc
        can :manage, Heb412Gen::Plantillahcm
        can :manage, Heb412Gen::Plantillahcr
        
        can :manage, Sip::Actorsocial
        can :manage, Sip::Persona
        can :manage, Sip::Respaldo7z

        can :manage, Sivel2Gen::Acto
        can :manage, Sivel2Gen::Actocolectivo
        can :manage, Sivel2Gen::Caso
        can :read, Sivel2Gen::Victima

        can :manage, Usuario
        can :manage, :tablasbasicas
        tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

