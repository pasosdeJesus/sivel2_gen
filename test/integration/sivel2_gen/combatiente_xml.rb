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

    test 'Valida caso con 1 combatiente' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      caso.save!
      combatiente = Sivel2Gen::Combatiente.create(
        caso_id: caso.id,
        nombre: "libio",
        alias: "alias combatiente",
        edad: 25,
        sexo: "M",
        resagresion_id: Sivel2Gen::Resagresion.first.id,
        profesion_id: Sivel2Gen::Profesion.first.id,
        rangoedad_id: Sivel2Gen::Rangoedad.first.id,
        filiacion_id: Sivel2Gen::Filiacion.first.id,
        sectorsocial_id: Sivel2Gen::Sectorsocial.first.id,
        organizacion_id: Sivel2Gen::Organizacion.first.id,
        vinculoestado_id: Sivel2Gen::Vinculoestado.first.id,
        organizacionarmada: Sivel2Gen::Presponsable.first.id
      )
      get caso_path(caso) + '.xrlat'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy!
      combatiente.destroy!
    end

  end
end
