# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class PruebaXml < PruebaIntegracion 
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    PRUEBA_CASOV = {
      fecha: '2014-11-19',
      memo: '',
      created_at: '2014-11-11'
    }

    PRUEBA_CASO_BASICOS = {
      fecha: '2014-11-19',
      memo: '',
      created_at: '2014-11-11',
      titulo: 'Caso de prueba con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }

    test 'caso valido' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASOV
      assert caso.valid?
      caso.destroy
    end

    test 'genera xml de un caso con datos basicos' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      get caso_path(caso) + '.xml'
      assert :success
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
    end

    test 'genera xml del caso y su ubicacion' do
      caso = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS
      ubicacion1 = Sip::Ubicacion.create(
        id_pais: 170,
        id_caso: caso.id,
        id_tsitio: 1,
        id_departamento: 17,
        id_municipio: 1152,
        created_at: '2014-11-06'
      )
      caso.ubicacion_id = [ubicacion1.id]
      get caso_path(caso) + '.xml'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      ubicacion1.destroy
      caso.destroy
    end

  end 
end
