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
      memo: '',
      created_at: '2019-08-30',
      titulo: 'Caso de prueba 1 con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }

    PRUEBA_CASO_BASICOS2 = {
      id: 2222,
      fecha: '2019-08-30',
      memo: '',
      created_at: '2019-08-30',
      titulo: 'Caso de prueba 2 con datos basicos',
      hora: '8 pm',
      duracion: '2 horas'
    }

    test 'crea dos casos y genera reporte json' do
      Sivel2Gen::Conscaso.refresca_conscaso
      caso1 = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS1

      ubicacion1 = Msip::Ubicacion.create(
        longitud: 87.3423,
        latitud: 23.2342,
        id_pais: 170,
        id_caso: caso1.id,
        id_tsitio: 1,
        id_departamento: 17,
        id_municipio: 1152,
        created_at: '2014-11-06'
      )
      ubicacion1.save!
      caso1.ubicacion_id = ubicacion1.id
      caso1.save!
      frontera1 = Sivel2Gen::Frontera.find(1)
      Sivel2Gen::CasoFrontera.create(
        id_frontera: frontera1.id,
        id_caso: caso1.id,
        created_at: '2014-11-06',
        updated_at: '2014-11-06'
      )
      region1 = Sivel2Gen::Region.find(9)
      Sivel2Gen::CasoRegion.create(
        id_region: region1.id,
        id_caso: caso1.id,
        created_at: '2014-11-06',
        updated_at: '2014-11-06'
      )
      caso2 = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS2
      ubicacion2 = Msip::Ubicacion.create(
        longitud: 77.3847,
        latitud: 3.3483,
        id_pais: 170,
        id_caso: caso2.id,
        id_tsitio: 1,
        id_departamento: 17,
        id_municipio: 1152,
        created_at: '2014-11-06'
      )
      ubicacion2.save!
      caso2.ubicacion_id = ubicacion2.id
      caso2.save!

      frontera2 = Sivel2Gen::Frontera.find(1)
      Sivel2Gen::CasoFrontera.create(
        id_frontera: frontera2.id,
        id_caso: caso2.id,
        created_at: '2014-11-06',
        updated_at: '2014-11-06'
      )
      Sivel2Gen::Conscaso.refresca_conscaso
      region2 = Sivel2Gen::Region.find(9)
      Sivel2Gen::CasoRegion.create(
        id_region: region2.id,
        id_caso: caso2.id,
        created_at: '2014-11-06',
        updated_at: '2014-11-06'
      )

      d12 = JSON.parse(<<EOS)
     {"1122":{"latitud":23.2342,"longitud":87.3423,"titulo":"Caso de prueba 1 con datos basicos", "fecha":"2019-08-30"},
     "2222":{"latitud":3.3483,"longitud":77.3847,"titulo":"Caso de prueba 2 con datos basicos", "fecha":"2019-08-30"}}

EOS
      puts d12
      # get casos_path + '.json'
      get '/sivel2/casos.json?utf8=&' \
          'filtro[fechaini]=2019-08-30&' \
          'filtro[fechafin]=2019-08-30'
      puts @response.body
      file = guarda_json(@response.body)
      docu = JSON.parse(File.read(file))
      compara(docu, d12)
      ubicacion1.destroy
      ubicacion2.destroy
      caso1.destroy
      caso2.destroy
    end

    def compara(json_ob, json_es)
      assert(JsonUtilities.compare_json(json_ob, json_es), 
             'Fallas en la comparación json')
    end
  end
end
