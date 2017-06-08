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
      #['Sivel2Gen', 'pconsolidado'], 
      ['Sivel2Gen', 'presponsable'], 
      ['Sivel2Gen', 'profesion'], 
      ['Sivel2Gen', 'rangoedad'],
      ['Sivel2Gen', 'region'], 
      ['Sivel2Gen', 'resagresion'], 
      ['Sivel2Gen', 'sectorsocial'], 
      ['Sivel2Gen', 'supracategoria'], 
      ['Sivel2Gen', 'vinculoestado'], 
      ['Sivel2Gen', 'tviolencia']
    ]

    def tablasbasicas 
      Sip::Ability::BASICAS_PROPIAS + BASICAS_PROPIAS
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
      ['Sivel2Gen', 'caso'], 
      ['Sivel2Gen', 'grupoper'], 
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
      ['Sivel2Gen', 'vinculoestado']
    ];
    def tablasbasicas_prio 
      Sip::Ability::BASICAS_PRIO + BASICAS_PRIO - [['Sip', 'grupo']]
    end

    def derechos
      "Dominio público de acuerdo a la legislación colombiana"
    end

    def organizacion_responsable
      'organizacion'
    end


    #byebug
    CAMPOS_PLANTILLAS_PROPIAS = {
      'Caso' => { 
        campos: ActiveRecord::Base.connection.data_source_exists?(
          'sivel2_gen_conscaso') ?
          Sivel2Gen::Conscaso.column_names : [],
        controlador: 'Sivel2Gen::CasosController'
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
