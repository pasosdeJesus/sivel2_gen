# frozen_string_literal:true

require 'test_helper'
require 'open-uri'
require 'json_utilities'
require 'minitest/autorun'
require 'json'

module Sivel2Gen
  class DetalleJson < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    PRUEBA_CASO_BASICOS = {
      id: 155265 ,
      fecha: '2018-01-01',
      memo: 'Paramilitares hirieron con arma de fuego a Kevin Enrique Umaña Morantes, de 18 años de edad, mientras se desplazaba por una calle del barrio Nueva Esperanza, Comuna 5. Según la fuente: “El hecho se presentó el 10 de julio, hacia las 6:00 de la mañana, cuando Umaña Morantes, era perseguido por dos sujetos a bordo de una motocicleta, al percatarse del hecho se refugió una vivienda a donde ingresaron los agresores y le propinaron dos impactos de arma de fuego. La zona tiene presencia de grupos posdesmovilización que se disputan el control territorial”.',
      created_at: '2016-07-10',
      titulo: ''
    }

    PRUEBA_PERSONA1 = {
      id: 244839,
      nombres: 'KEVIN ENRIQUE',
      apellidos: 'UMAÑA MORANTES',
      anionac: 1998,
      mesnac: '06',
      dianac: '15',
      sexo: 'M'
    }

    PRUEBA_PROFESION = {
      id: 1000,
      nombre: 'Profesion',
      fechacreacion: '2014-09-09',
      created_at: '2014-09-09'
    }

    PRUEBA_RANGOEDAD = {
      id: 1000,
      nombre: 'De 0 a 15 Años',
      rango: '1-2',
      limiteinferior: 1,
      limitesuperior: 2,
      fechacreacion: '2014-09-09',
      created_at: '2014-09-09'
    }

    PRUEBA_SECTORSOCIAL = {
      id: 1000,
      nombre: 'Pruebaempleado',
      fechacreacion: '2014-09-09'
    }

    test 'Valida caso en JSON detallado' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      ubicaso = Msip::Ubicacion.create(
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
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      persona1 =  Msip::Persona.create! PRUEBA_PERSONA1
      rangoedad = Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
      profesion = Sivel2Gen::Profesion.create! PRUEBA_PROFESION
      sectorsocial = Sivel2Gen::Sectorsocial.create! PRUEBA_SECTORSOCIAL
      victima1 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona1.id,
        id_etnia: 5,
        id_iglesia: nil,
        id_rangoedad: rangoedad.id
      )

      presponsable = Sivel2Gen::Presponsable.find(14)
      Sivel2Gen::CasoPresponsable.create(
        id_caso: caso.id,
        id_presponsable: presponsable.id,
        tipo: 1
      )
      categoria1 = Sivel2Gen::Categoria.find(13)
      categoria2 = Sivel2Gen::Categoria.find(702)
      acto1 = Sivel2Gen::Acto.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria1.id,
        id_persona: persona1.id,
        id_caso: caso.id,
        created_at: '2019-01-01'
      )
      acto2 = Sivel2Gen::Acto.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria2.id,
        id_persona: persona1.id,
        id_caso: caso.id,
        created_at: '2019-01-01'
      )
      intervalo = Sivel2Gen::Intervalo.find(2)
      caso.id_intervalo = intervalo.id
      contexto = Sivel2Gen::Contexto.find(28)
      Sivel2Gen::CasoContexto.create(
        id_caso: caso.id,
        id_contexto: contexto.id,
        created_at: '2014-09-09'
      )
      region1 = Sivel2Gen::Region.find(6)
      Sivel2Gen::CasoRegion.create(
        id_caso: caso.id,
        id_region: region1.id
      )
      frontera1= Sivel2Gen::Frontera.find(1)
      Sivel2Gen::CasoFrontera.create(
        id_frontera: frontera1.id,
        id_caso: caso.id
      )
      Sivel2Gen::Conscaso.refresca_conscaso
      get caso_path(caso) + '.json'
      puts @response.body
      file = guarda_json(@response.body)
      docu = JSON.parse(File.read(file))
      d12 = JSON.parse(<<EOS)
      {"caso": 
        {
            "id":155265,
            "titulo": "",
            "hechos":"Paramilitares hirieron con arma de fuego a Kevin Enrique Umaña Morantes, de 18 años de edad, mientras se desplazaba por una calle del barrio Nueva Esperanza, Comuna 5. Según la fuente: “El hecho se presentó el 10 de julio, hacia las 6:00 de la mañana, cuando Umaña Morantes, era perseguido por dos sujetos a bordo de una motocicleta, al percatarse del hecho se refugió una vivienda a donde ingresaron los agresores y le propinaron dos impactos de arma de fuego. La zona tiene presencia de grupos posdesmovilización que se disputan el control territorial”.",
            "fecha": "2018-01-01",
            "departamento": "VALLE DEL CAUCA",
            "municipio": "BUENAVENTURA",
            "centro_poblado": "SAN JOSÉ",
            "presponsables":
              {
                "14":"PARAMILITARES"
              },
            "victimas": 
              {
                "244839":"KEVIN ENRIQUE UMAÑA MORANTES"
              }
         }
      }
EOS
      puts d12
      compara(docu, d12)
      ubicaso.destroy
      caso.destroy
      acto1.destroy
      acto2.destroy
      persona1.destroy
      rangoedad.destroy
      profesion.destroy
      sectorsocial.destroy
      victima1.destroy
    end

    def compara(json_ob, json_es)
      assert(JsonUtilities.compare_json(json_ob,json_es), "Fallas en la comparación")
    end
  end
end
