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
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test 'genera xml del caso con varias ubicaciones' do
      caso = Sivel2Gen::Caso.create PRUEBA_CASO
      ubicaso1 = Msip::Ubicacion.create(
        lugar: 'VEREDA EL PAPAYO',
        sitio: 'UNO DE LOS EXTREMOS DEL RÍO YURUMANGUÍ EN LA RIVERA DEL RÍO',
        id_caso: caso.id,
        id_tsitio: 3,
        id_pais: 170,
        id_departamento: 47,
        id_municipio: 86,
        id_clase: 11_737,
        created_at: '2019-01-01',
        longitud: -77.0697417935442,
        latitud: 3.89381723858445
      )
      ubicaso1.save!
      ubicaso2 = Msip::Ubicacion.create(
        lugar: 'VEREDA EL PAPAYO',
        sitio: 'UNO DE LOS EXTREMOS DEL RÍO YURUMANGUÍ EN LA RIVERA DEL RÍO',
        id_caso: caso.id,
        id_tsitio: 3,
        id_pais: 170,
        id_departamento: 57,
        id_municipio: 335,
        id_clase: 13_117,
        created_at: '2019-01-01',
        longitud: -71.9515773351967,
        latitud: 1.33679247514188
      )
      ubicaso2.save!
      caso.ubicacion_id = ubicaso2.id
      caso.save!
      get caso_path(caso) + '.xrlat'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      assert verifica_dtd(docu)
      ubicaso1.destroy
      ubicaso2.destroy
      caso.destroy
    end
  end
end
