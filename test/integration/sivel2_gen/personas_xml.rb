# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class PersonasXml < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test 'Valida caso con 1 victima' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        id_departamento: 4,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      persona = Msip::Persona.create! PRUEBA_PERSONA
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
      get caso_path(caso) + '.xrlat'
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
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        id_departamento: 4,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      persona1 =  Msip::Persona.create! PRUEBA_PERSONA
      persona2 =  Msip::Persona.create! PRUEBA_PERSONA
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
      get caso_path(caso) + '.xrlat'
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
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        id_departamento: 4,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      grupoper = Msip::Grupoper.create(
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
      get caso_path(caso) + '.xrlat'
      # puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
    end

    test 'valida caso con 2 victimas colectivas' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        id_departamento: 4,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      grupoper1 = Msip::Grupoper.create(
        nombre: 'Nombre de grupo',
        anotaciones: 'Anotaciones de ejemplo',
        created_at: '2014-09-09'
      )
      grupoper2 = Msip::Grupoper.create(
        nombre: 'Nombre de grupo',
        anotaciones: 'Anotaciones de ejemplo',
        created_at: '2014-09-09'
      )
      victimacolectiva1 = Sivel2Gen::Victimacolectiva.create(
        id_grupoper: grupoper1.id,
        id_caso: caso.id,
        personasaprox: 5,
        organizacionarmada: 5
      )
      victimacolectiva2 = Sivel2Gen::Victimacolectiva.create(
        id_grupoper: grupoper2.id,
        id_caso: caso.id,
        personasaprox: 5,
        organizacionarmada: 5
      )
      get caso_path(caso) + '.xrlat'
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
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        id_departamento: 4,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      presponsable = Sivel2Gen::Presponsable.create(
        id: 1000,
        nombre: 'Nombre de grupo',
        fechacreacion: '2014-09-09',
        created_at: '2014-09-09'
      )
      casopresponsable = Sivel2Gen::CasoPresponsable.create(
        id_caso: caso.id,
        id_presponsable: presponsable.id,
      )
      get caso_path(caso) + '.xrlat'
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      presponsable.destroy
      casopresponsable.destroy
    end
  end
end
