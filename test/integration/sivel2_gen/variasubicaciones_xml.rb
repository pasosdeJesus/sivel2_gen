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
        caso_id: caso.id,
        tsitio_id: 3,
        pais_id: 170,
        departamento_id: 47,
        municipio_id: 86,
        centropoblado_id: 11_737,
        created_at: '2019-01-01',
        longitud: -77.0697417935442,
        latitud: 3.89381723858445
      )
      ubicaso1.save!
      ubicaso2 = Msip::Ubicacion.create(
        lugar: 'VEREDA EL PAPAYO',
        sitio: 'UNO DE LOS EXTREMOS DEL RÍO YURUMANGUÍ EN LA RIVERA DEL RÍO',
        caso_id: caso.id,
        tsitio_id: 3,
        pais_id: 170,
        departamento_id: 57,
        municipio_id: 335,
        centropoblado_id: 13_117,
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
