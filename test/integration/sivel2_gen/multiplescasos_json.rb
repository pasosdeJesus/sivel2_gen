# frozen_string_literal:true

require 'test_helper'
require 'open-uri'
require 'json_utilities'
require 'minitest/autorun'
require 'json'

module Sivel2Gen
  class PruebaXml < PruebaIntegracion 
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    PRUEBA_CASO_BASICOS1 = {
      id: 1122,
      fecha: '2019-08-30',
      memo: 'a',
      created_at: '2019-08-30',
      titulo: 'Caso de prueba 1 con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }

    PRUEBA_CASO_BASICOS2 = {
      id: 2222,
      fecha: '2019-08-30',
      memo: 'b',
      created_at: '2019-08-30',
      titulo: 'Caso de prueba 2 con datos basicos',
      hora: '8 pm',
      duracion: '2 horas'
    }

    test 'crea dos casos y genera reporte json' do
      skip
      Sivel2Gen::Conscaso.refresca_conscaso
      caso1 = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS1

      ubicacion1 = Msip::Ubicacion.create(
        longitud: 87.3423,
        latitud: 23.2342,
        pais_id: 170,
        caso_id: caso1.id,
        tsitio_id: 1,
        departamento_id: 17,
        municipio_id: 1152,
        created_at: '2014-11-06'
      )
      ubicacion1.save!
      caso1.ubicacion_id = ubicacion1.id
      caso1.save!
      frontera1 = Sivel2Gen::Frontera.find(1)
      Sivel2Gen::CasoFrontera.create(
        frontera_id: frontera1.id,
        caso_id: caso1.id,
        created_at: '2014-11-06',
        updated_at: '2014-11-06'
      )
      region1 = Sivel2Gen::Region.find(9)
      Sivel2Gen::CasoRegion.create(
        region_id: region1.id,
        caso_id: caso1.id,
      )
      caso2 = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS2
      ubicacion2 = Msip::Ubicacion.create(
        longitud: 77.3847,
        latitud: 3.3483,
        pais_id: 170,
        caso_id: caso2.id,
        tsitio_id: 1,
        departamento_id: 17,
        municipio_id: 1152,
        created_at: '2014-11-06'
      )
      ubicacion2.save!
      caso2.ubicacion_id = ubicacion2.id
      caso2.save!

      frontera2 = Sivel2Gen::Frontera.find(1)
      Sivel2Gen::CasoFrontera.create(
        frontera_id: frontera2.id,
        caso_id: caso2.id,
        created_at: '2014-11-06',
        updated_at: '2014-11-06'
      )
      Sivel2Gen::Conscaso.refresca_conscaso
      region2 = Sivel2Gen::Region.find(9)
      Sivel2Gen::CasoRegion.create(
        region_id: region2.id,
        caso_id: caso2.id,
      )

      d12 = JSON.parse(<<EOS)
     {"1122":{"latitud":23.2342,"longitud":87.3423,"titulo":"Caso de prueba 1 con datos basicos", "fecha":"2019-08-30"},
     "2222":{"latitud":3.3483,"longitud":77.3847,"titulo":"Caso de prueba 2 con datos basicos", "fecha":"2019-08-30"}}

EOS
      puts d12
      # get casos_path + '.json'
      ruta = "#{ENV.fetch("RUTA_RELATIVA", "sivel2")}casos.json?utf8=&" \
          'filtro[fechaini]=2019-08-30&' \
          'filtro[fechafin]=2019-08-30'
      get ruta
      puts @response.body
      file = guarda_json(@response.body)
      docu = JSON.parse(File.read(file))
      debugger
      compara(docu, d12)
      ubicacion1.destroy
      ubicacion2.destroy
      caso1.destroy
      caso2.destroy
    end

    def compara(json_ob, json_es)
      debugger
      assert(JsonUtilities.compare_json(json_ob, json_es), 
             'Fallas en la comparación json')
    end
  end
end
