# encoding: UTF-8
module Sivel2Gen
  class Ability < Sip::Ability
    include CanCan::Ability

    ROLADMIN  = 1
    #ROLINV    = 2
    #ROLDIR    = 3
    #ROLCOOR   = 4
    ROLOPERADOR = 5
    #ROLSIST   = 6
    ROLCONSULTA = 7

    ROLES = Sip::Ability::ROLES

    GRUPO_ANALISTA_CASOS = 20
    GRUPO_OBSERVADOR_CASOS = 21


    BASICAS_PROPIAS = [
      ['Sivel2Gen', 'actividadoficio'],
      ['Sivel2Gen', 'antecedente'],
      ['Sivel2Gen', 'categoria'],
      ['Sivel2Gen', 'contextovictima'],
      ['Sivel2Gen', 'contexto'],
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
      ['Sivel2Gen', 'resagresion'],
      ['Sivel2Gen', 'sectorsocial'],
      ['Sivel2Gen', 'supracategoria'],
      ['Sivel2Gen', 'tviolencia'],
      ['Sivel2Gen', 'vinculoestado']
    ]

    def tablasbasicas
      r = (Sip::Ability::BASICAS_PROPIAS - 
           [['Sip', 'oficina']]) + BASICAS_PROPIAS 
      return r
    end

    # Tablas básicas cuyo id no es autoincremental
    BASICAS_ID_NOAUTO = [
      ['Sivel2Gen', 'categoria'],
      ['Sivel2Gen', 'tviolencia']
    ]

    def basicas_id_noauto
      Sip::Ability::BASICAS_ID_NOAUTO + BASICAS_ID_NOAUTO
    end

    # Tablas no básicas pero que tienen índice
    NOBASICAS_INDSEQID =  [
      ['Sivel2Gen', 'caso']
    ]

    # Tablas no básicas pero que tienen índice con secuencia id_seq
    def nobasicas_indice_seq_con_id
      Sip::Ability::NOBASICAS_INDSEQID + NOBASICAS_INDSEQID
    end

    # Tablas básicas que deben volcarse primero --por ser requeridas
    # por otras básicas
    BASICAS_PRIO = [
      ['Sivel2Gen', 'pconsolidado'],
      ['Sivel2Gen', 'tviolencia'],
      ['Sivel2Gen', 'supracategoria'],
      ['Sivel2Gen', 'intervalo'],
      ['Sivel2Gen', 'filiacion'],
      ['Sivel2Gen', 'organizacion'],
      ['Sivel2Gen', 'sectorsocial'],
      ['Sivel2Gen', 'vinculoestado'],
      ['Sivel2Gen', 'contextovictima']
    ];
    def tablasbasicas_prio
      Sip::Ability::BASICAS_PRIO + BASICAS_PRIO - [['Sip', 'grupo']]
    end
    def self.derechos
      'Creative Commons Atribución 2.5 Colombia. http://creativecommons.org/licenses/by/2.5/co/'
    end
    def self.organizacion_responsable
      'Banco de Datos del CINEP'
    end

    #if ActiveRecord::Base.connection.data_source_exists?('sivel2_gen_caso')
    # Sivel2Gen::Consexpcaso.crea_consexpcaso(nil)
    #end

    CAMPOS_PLANTILLAS_PROPIAS = {
      'Caso' => {
        campos: [
          :caso_id,
          :fecha,
          :memo,
          :ubicaciones,
          :victimas,
          :presponsables,
          :tipificacion,
          :titulo,
          :hora,
          :duracion,
          :grconfiabilidad,
          :gresclarecimiento,
          :grimpunidad,
          :grinformacion,
          :bienes,
          :id_intervalo,
          :created_at,
          :updated_at
        ],
        controlador: 'Sivel2Gen::CasosController',
        ruta: '/casos'
      },
      'Victima' => {
        campos: ActiveRecord::Base.connection.data_source_exists?(
          'sivel2_gen_victima') ?
          (Sivel2Gen::Victima.column_names + [
            :departamento_caso,
            :fecha_caso_localizada,
            :municipio_caso,
            :nombre,
            :contextovictima,
            :profesion,
            :presponsables_caso,
            :presponsables_caso_ids,
            :rot1,
            :rot2,
            :rot3,
            :rot4,
            :rot5,
            :rot6,
            :rot7,
            :rot8,
            :rot9,
            :rot10,
            :rot11,
            :rot12,
            :rot13,
            :rot14,
            :rot15,
            :rot16,
            :rot17,
            :rot18,
            :rot19,
            :rot20,
            :rot21,
            :rot22,
            :rot23,
            :rot24,
            :rot25,
            :rot26,
            :rot27,
            :rot28,
            :rot29,
            :rot30,
            :rot31,
            :rot32,
            :rot33,
            :rot34,
            :rot35,
            :rot36,
            :rot37,
            :rot38,
            :rot39,
            :sexo,
            :trimestre_caso,
            :ubicacion_caso,
          ]) : [],
        controlador: 'Sivel2Gen::CasosController',
        ruta: '/casos'
      }

    }

    def campos_plantillas
      n = Heb412Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.
        clone.merge(CAMPOS_PLANTILLAS_PROPIAS)
      #byebug
      return n
    end


    # Establece autorizaciones con CanCanCan
    def initialize_sivel2_gen(usuario = nil)
      # Sin autenticación puede consultarse información geográfica
      can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]

      # Hacer conteos
      can :cuenta, Sivel2Gen::Caso

      # La consulta web es publica dependiendo de
      if usuario || Rails.application.config.x.sivel2_consulta_web_publica
        can :buscar, Sivel2Gen::Caso
        can :contar, Sivel2Gen::Caso
        can :lista, Sivel2Gen::Caso

        # API público
        # Mostrar un caso con casos/101
        # Mostrar un caso en XML - HTML con casos/101.xml
        # Mostrar un caso en XML para descarga casos/101.xrlat
        can :show, Sivel2Gen::Caso

        #Mostrar hasta 4000 casos
        can :index4000, Sivel2Gen::Caso
      end

      if !usuario || usuario.fechadeshabilitacion
        return
      end

      # Los siguientes son para todo autenticado

      can [:read, :update], Mr519Gen::Encuestausuario
      can :read, Sip::Actorsocial

      can :descarga_anexo, Sip::Anexo

      can :contar, Sip::Ubicacion
      can :nuevo, Sip::Ubicacion

      can :nuevo, Sivel2Gen::Combatiente

      can :nuevo, Sivel2Gen::Presponsable

      can :nuevo, Sivel2Gen::Victima

      can :nuevo, Sivel2Gen::Victimacolectiva

      can :index, Sivel2Gen::Caso

      if usuario && usuario.rol then
        case usuario.rol
        when Ability::ROLANALI
          can :read, Heb412Gen::Doc
          can :read, Heb412Gen::Plantilladoc
          can :read, Heb412Gen::Plantillahcm
          can :read, Heb412Gen::Plantillahcr
          can :index, Sivel2Gen::Victima

          can :manage, Sip::Bitacora, usuario: { id: usuario.id }

          if usuario.sip_grupo &&
              usuario.sip_grupo.pluck(:id).include?(GRUPO_ANALISTA_CASOS)
            can :manage, Sip::Actorsocial
            can :read, Sip::Bitacora
            can :manage, Sip::Persona

            can :manage, Sivel2Gen::Acto
            can :manage, Sivel2Gen::Actocolectivo
            can [:read, :new, :edit, :update, :create, :nuevo, :destroy], Sivel2Gen::Caso

            cannot :solocambiaretiquetas, Sivel2Gen::Caso
            can :refresca, Sivel2Gen::Caso

            can :read, Sivel2Gen::Victima
          else #Suponemos que es Observador
            #if usuario.sip_grupo &&
            #usuario.sip_grupo.pluck(:id).include?(GRUPO_OBSERVADOR_CASOS)
            can :read, Sip::Actorsocial
            can :read, Sip::Bitacora, usuario: { id: usuario.id }
            can :read, Sip::Persona

            can :read, Sivel2Gen::Acto
            can :read, Sivel2Gen::Actocolectivo
            can [:read, :edit, :solocambiaretiquetas, :update], Sivel2Gen::Caso
            cannot [:new, :create], Sivel2Gen::Caso
            can :read, Sivel2Gen::Victima
          end
        when Ability::ROLADMIN
          can :manage, Heb412Gen::Doc
          can :manage, Heb412Gen::Plantilladoc
          can :manage, Heb412Gen::Plantillahcm
          can :manage, Heb412Gen::Plantillahcr

          can :manage, Mr519Gen::Formulario
          can :manage, Mr519Gen::Encuestausuario 

          can :manage, Sip::Actorsocial
          can :manage, Sip::Bitacora
          can :manage, Sip::Persona
          can :manage, Sip::Respaldo7z

          can :manage, Sivel2Gen::Acto
          can :manage, Sivel2Gen::Actocolectivo
          can :manage, Sivel2Gen::Caso
          cannot :solocambiaretiquetas, Sivel2Gen::Caso
          can :read, Sivel2Gen::Victima

          can :manage, Usuario
          can :manage, :tablasbasicas
          tablasbasicas.each do |t|
            c = Ability.tb_clase(t)
            can :manage, c
          end
        end # case
      end # if
    end # def initialize_sivel2_gen


  end # class
end   # module
