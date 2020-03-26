# encoding: UTF-8
module Sivel2Gen
  class Ability < Sip::Ability
    include CanCan::Ability

    ROLADMIN  = 1
    #ROLINV    = 2
    #ROLDIR    = 3
    #ROLCOOR   = 4
    ROLANALI  = 5
    #ROLSIST   = 6

    ROLES = Sip::Ability::ROLES

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
      r = (Sip::Ability::BASICAS_PROPIAS - [['Sip', 'oficina']]) +
        BASICAS_PROPIAS
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
    #	Sivel2Gen::Consexpcaso.crea_consexpcaso(nil)
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


  end # class
end   # module
