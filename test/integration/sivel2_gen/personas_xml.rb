# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class PersonasXml < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
      @routes = Engine.routes
    end

    PRUEBA_CASO_BASICOS = {
      fecha: '2014-11-19',
      memo: '',
      created_at: '2014-11-11',
      titulo: 'Caso de prueba con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }
 
    PRUEBA_PERSONA = {
      nombres: 'Nombres'.freeze,
      apellidos: 'Apellidos'.freeze,
      anionac: 1974,
      mesnac: 1,
      dianac: 1,
      sexo: 'F',
      id_pais: 170,
      id_departamento: 17,
      id_municipio: 1152,
      id_clase: 2626,
      tdocumento_id: 1,
      numerodocumento: '10000000'.freeze,
      nacionalde: 170
   }
 
   PRUEBA_PROFESION = {
        id: 1000,
        nombre: 'Profesion'.freeze,
        fechacreacion: '2014-09-09'.freeze,
        created_at: '2014-09-09'.freeze
    }

    PRUEBA_RANGOEDAD = {
    	id: 1000,
        nombre: 'Rangoedad'.freeze,
        rango: '1-2'.freeze,
        limiteinferior: 1,
        limitesuperior: 2,
        fechacreacion: '2014-09-09'.freeze,
        created_at: '2014-09-09'.freeze
    }

    PRUEBA_SECTORSOCIAL = {
        id: 1000,
        nombre: 'Pruebaumpleado'.freeze,
        fechacreacion: '2014-09-09'.freeze
    }
 
    test 'Valida caso con 1 victima' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      persona =  Sip::Persona.create! PRUEBA_PERSONA
      rangoedad = Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
      profesion = Sivel2Gen::Profesion.create! PRUEBA_PROFESION
      sectorsocial = Sivel2Gen::Sectorsocial.create! PRUEBA_SECTORSOCIAL
      victima = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona.id,
        id_rangoedad: rangoedad.id,
        id_etnia: 105,
        id_profesion: profesion.id,
        id_sectorsocial: sectorsocial.id
      )
      get caso_path(caso) + '.xml'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      persona.destroy
      rangoedad.destroy
      victima.destroy
    end
 
    test 'valida caso con 2 victimas' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      persona1 =  Sip::Persona.create! PRUEBA_PERSONA
      persona2 =  Sip::Persona.create! PRUEBA_PERSONA
      profesion = Sivel2Gen::Profesion.create! PRUEBA_PROFESION
      sectorsocial = Sivel2Gen::Sectorsocial.create! PRUEBA_SECTORSOCIAL
      rangoedad = Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
      victima1 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona1.id,
        id_rangoedad: rangoedad.id,
        id_etnia: 105,
        id_sectorsocial: sectorsocial.id,
        id_profesion: profesion.id
      )
      victima2 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona2.id,
        id_rangoedad: rangoedad.id,
        id_etnia: 105,
        id_sectorsocial: sectorsocial.id,
        id_profesion: profesion.id
      )
      get caso_path(caso) + '.xml'
      # puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      persona1.destroy
      persona2.destroy
      rangoedad.destroy
      victima1.destroy
      victima2.destroy
    end
 
    test 'valida caso con 1 victima colectiva' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      grupoper = Sip::Grupoper.create(
        nombre: 'Nombre de grupo',
        anotaciones: 'Anotaciones de ejemplo',
        created_at: '2014-09-09'
      )
      victimacolectiva = Sivel2Gen::Victimacolectiva.create(
        id_grupoper: grupoper.id,
        id_caso: caso.id,
        personasaprox: 5,
        organizacionarmada: 5
      )
      get caso_path(caso) + '.xml'
      # puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
    end
 
    test 'valida caso con 2 victimas colectivas' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      grupoper1 = Sip::Grupoper.create(
        nombre: 'Nombre de grupo',
        anotaciones: 'Anotaciones de ejemplo',
        created_at: '2014-09-09')
      grupoper2 = Sip::Grupoper.create(
        nombre: 'Nombre de grupo',
        anotaciones: 'Anotaciones de ejemplo',
        created_at: '2014-09-09')
      victimacolectiva1 = Sivel2Gen::Victimacolectiva.create(
        id_grupoper: grupoper1.id,
        id_caso: caso.id,
        personasaprox: 5,
        organizacionarmada: 5)
      victimacolectiva2 = Sivel2Gen::Victimacolectiva.create(
        id_grupoper: grupoper2.id,
        id_caso: caso.id,
        personasaprox: 5,
        organizacionarmada: 5)
      get caso_path(caso) + '.xml'
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      victimacolectiva1.destroy
      victimacolectiva2.destroy
      grupoper1.destroy
      grupoper2.destroy
      caso.destroy
    end
 
    test 'valida con 1 presunto responsable' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      presponsable = Sivel2Gen::Presponsable.create(
        id: 1000,
        nombre: 'Nombre de grupo',
        fechacreacion: '2014-09-09',
        created_at: '2014-09-09'
      )
      casopresponsable = Sivel2Gen::CasoPresponsable.create(
        id_caso: caso.id,
        id_presponsable: presponsable.id,
        bloque: 'Bloque',
        frente: 'Frente',
        brigada: 'Brigada'
      )
      get caso_path(caso) + '.xml'
      # puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      presponsable.destroy
      casopresponsable.destroy
    end

    def guarda_xml(docu)
      file = File.new('test/dummy/public/relatos.xrlat', 'wb')
      file.write(docu)
      file.close
      file
    end

    def verifica_dtd(docu)
      options = Nokogiri::XML::ParseOptions::DTDVALID
      doc = Nokogiri::XML::Document.parse(docu, nil, nil, options)
      puts doc.external_subset.validate(doc)
      assert_empty doc.external_subset.validate(doc)
    end
  end
end
