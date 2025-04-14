# frozen_string_literal:true

require "test_helper"
require "nokogiri"
require "open-uri"

module Sivel2Gen
  class PersonasXml < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      Rails.application.try(:reload_routes_unless_loaded)

      @routes = Engine.routes
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test "Valida caso con 1 victima" do
      caso = Sivel2Gen::Caso.create!(PRUEBA_CASO)
      ubicaso = Msip::Ubicacion.create(
        caso_id: caso.id,
        pais_id: 170,
        departamento_id: 4,
        created_at: "2019-01-01",
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      persona = Msip::Persona.create!(PRUEBA_PERSONA)
      rangoedad = Sivel2Gen::Rangoedad.create!(PRUEBA_RANGOEDAD)
      profesion = Sivel2Gen::Profesion.create!(PRUEBA_PROFESION)
      sectorsocial = Sivel2Gen::Sectorsocial.create!(PRUEBA_SECTORSOCIAL)
      victima = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona.id,
        rangoedad_id: rangoedad.id,
        profesion_id: profesion.id,
        sectorsocial_id: sectorsocial.id,
      )
      get caso_path(caso) + ".xrlat"
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      persona.destroy
      rangoedad.destroy
      victima.destroy
    end

    test "valida caso con 2 victimas" do
      caso = Sivel2Gen::Caso.create!(PRUEBA_CASO)
      ubicaso = Msip::Ubicacion.create(
        caso_id: caso.id,
        pais_id: 170,
        departamento_id: 4,
        created_at: "2019-01-01",
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      persona1 =  Msip::Persona.create!(PRUEBA_PERSONA)
      persona2 =  Msip::Persona.create!(PRUEBA_PERSONA)
      profesion = Sivel2Gen::Profesion.create!(PRUEBA_PROFESION)
      sectorsocial = Sivel2Gen::Sectorsocial.create!(PRUEBA_SECTORSOCIAL)
      rangoedad = Sivel2Gen::Rangoedad.create!(PRUEBA_RANGOEDAD)
      victima1 = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona1.id,
        rangoedad_id: rangoedad.id,
        sectorsocial_id: sectorsocial.id,
        profesion_id: profesion.id,
      )
      victima2 = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona2.id,
        rangoedad_id: rangoedad.id,
        sectorsocial_id: sectorsocial.id,
        profesion_id: profesion.id,
      )
      get caso_path(caso) + ".xrlat"
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

    test "valida caso con 1 victima colectiva" do
      caso = Sivel2Gen::Caso.create!(PRUEBA_CASO)
      ubicaso = Msip::Ubicacion.create(
        caso_id: caso.id,
        pais_id: 170,
        departamento_id: 4,
        created_at: "2019-01-01",
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      grupoper = Msip::Grupoper.create(
        nombre: "Nombre de grupo",
        anotaciones: "Anotaciones de ejemplo",
        created_at: "2014-09-09",
      )
      victimacolectiva = Sivel2Gen::Victimacolectiva.create(
        grupoper_id: grupoper.id,
        caso_id: caso.id,
        personasaprox: 5,
        organizacionarmada: 5,
      )
      get caso_path(caso) + ".xrlat"
      # puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
    end

    test "valida caso con 2 victimas colectivas" do
      caso = Sivel2Gen::Caso.create!(PRUEBA_CASO)
      ubicaso = Msip::Ubicacion.create(
        caso_id: caso.id,
        pais_id: 170,
        departamento_id: 4,
        created_at: "2019-01-01",
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      grupoper1 = Msip::Grupoper.create(
        nombre: "Nombre de grupo",
        anotaciones: "Anotaciones de ejemplo",
        created_at: "2014-09-09",
      )
      grupoper2 = Msip::Grupoper.create(
        nombre: "Nombre de grupo",
        anotaciones: "Anotaciones de ejemplo",
        created_at: "2014-09-09",
      )
      victimacolectiva1 = Sivel2Gen::Victimacolectiva.create(
        grupoper_id: grupoper1.id,
        caso_id: caso.id,
        personasaprox: 5,
        organizacionarmada: 5,
      )
      victimacolectiva2 = Sivel2Gen::Victimacolectiva.create(
        grupoper_id: grupoper2.id,
        caso_id: caso.id,
        personasaprox: 5,
        organizacionarmada: 5,
      )
      get caso_path(caso) + ".xrlat"
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      victimacolectiva1.destroy
      victimacolectiva2.destroy
      grupoper1.destroy
      grupoper2.destroy
      caso.destroy
    end

    test "valida con 1 presunto responsable" do
      caso = Sivel2Gen::Caso.create!(PRUEBA_CASO)
      ubicaso = Msip::Ubicacion.create(
        caso_id: caso.id,
        pais_id: 170,
        departamento_id: 4,
        created_at: "2019-01-01",
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      presponsable = Sivel2Gen::Presponsable.create(
        id: 1000,
        nombre: "Nombre de grupo",
        fechacreacion: "2014-09-09",
        created_at: "2014-09-09",
      )
      casopresponsable = Sivel2Gen::CasoPresponsable.create(
        caso_id: caso.id,
        presponsable_id: presponsable.id,
      )
      get caso_path(caso) + ".xrlat"
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      presponsable.destroy
      casopresponsable.destroy
    end
  end
end
