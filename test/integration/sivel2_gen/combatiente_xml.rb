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

    PRUEBA_CASO_BASICOS = {
      fecha: '2014-11-19',
      memo: '',
      created_at: '2014-11-11',
      titulo: 'Caso de prueba con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }

    test 'Valida caso con 1 combatiente' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      caso.save!
      combatiente = Sivel2Gen::Combatiente.create(
        id_caso: caso.id,
        nombre: "libio",
        alias: "alias combatiente",
        edad: 25,
        sexo: "M",
        id_resagresion: Sivel2Gen::Resagresion.first.id,
        id_profesion: Sivel2Gen::Profesion.first.id,
        id_rangoedad: Sivel2Gen::Rangoedad.first.id,
        id_filiacion: Sivel2Gen::Filiacion.first.id,
        id_sectorsocial: Sivel2Gen::Sectorsocial.first.id,
        id_organizacion: Sivel2Gen::Organizacion.first.id,
        id_vinculoestado: Sivel2Gen::Vinculoestado.first.id,
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
