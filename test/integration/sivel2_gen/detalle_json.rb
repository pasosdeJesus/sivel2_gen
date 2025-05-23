# frozen_string_literal:true

require "test_helper"
require "open-uri"
require "json_utilities"
require "minitest/autorun"
require "json"

module Sivel2Gen
  class DetalleJson < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      Rails.application.try(:reload_routes_unless_loaded)

      @routes = Engine.routes
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    PRUEBA_CASO_BASICOS = {
      id: 155265,
      fecha: "2018-01-01",
      memo: "Paramilitares hirieron con arma de fuego a Kevin Enrique Umaña Morantes, de 18 años de edad, mientras se desplazaba por una calle del barrio Nueva Esperanza, Comuna 5. Según la fuente: “El hecho se presentó el 10 de julio, hacia las 6:00 de la mañana, cuando Umaña Morantes, era perseguido por dos sujetos a bordo de una motocicleta, al percatarse del hecho se refugió una vivienda a donde ingresaron los agresores y le propinaron dos impactos de arma de fuego. La zona tiene presencia de grupos posdesmovilización que se disputan el control territorial”.",
      created_at: "2016-07-10",
      titulo: "",
    }

    PRUEBA_PERSONA1 = {
      id: 244839,
      nombres: "KEVIN ENRIQUE",
      apellidos: "UMAÑA MORANTES",
      anionac: 1998,
      mesnac: "06",
      dianac: "15",
      sexo: "M",
    }

    test "Valida caso en JSON detallado" do
      caso = Sivel2Gen::Caso.create!(PRUEBA_CASO_BASICOS)
      ubicaso = Msip::Ubicacion.create(
        lugar: "VEREDA EL PAPAYO",
        sitio: "UNO DE LOS EXTREMOS DEL RÍO YURUMANGUÍ EN LA RIVERA DEL RÍO",
        caso_id: caso.id,
        tsitio_id: 3,
        pais_id: 170,
        departamento_id: 47,
        municipio_id: 86,
        centropoblado_id: 11_737,
        created_at: "2019-01-01",
        longitud: -77.0697417935442,
        latitud: 3.89381723858445,
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      persona1 =  Msip::Persona.create!(PRUEBA_PERSONA1)
      rangoedad = Sivel2Gen::Rangoedad.create!(PRUEBA_RANGOEDAD)
      profesion = Sivel2Gen::Profesion.create!(PRUEBA_PROFESION)
      sectorsocial = Sivel2Gen::Sectorsocial.create!(PRUEBA_SECTORSOCIAL)
      victima1 = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona1.id,
        iglesia_id: nil,
        rangoedad_id: rangoedad.id,
      )

      presponsable = Sivel2Gen::Presponsable.find(14)
      Sivel2Gen::CasoPresponsable.create(
        caso_id: caso.id,
        presponsable_id: presponsable.id,
        tipo: 1,
      )
      categoria1 = Sivel2Gen::Categoria.find(13)
      categoria2 = Sivel2Gen::Categoria.find(702)
      acto1 = Sivel2Gen::Acto.create(
        presponsable_id: presponsable.id,
        categoria_id: categoria1.id,
        persona_id: persona1.id,
        caso_id: caso.id,
        created_at: "2019-01-01",
      )
      acto2 = Sivel2Gen::Acto.create(
        presponsable_id: presponsable.id,
        categoria_id: categoria2.id,
        persona_id: persona1.id,
        caso_id: caso.id,
        created_at: "2019-01-01",
      )
      intervalo = Sivel2Gen::Intervalo.find(2)
      caso.intervalo_id = intervalo.id
      contexto = Sivel2Gen::Contexto.find(28)
      Sivel2Gen::CasoContexto.create(
        caso_id: caso.id,
        contexto_id: contexto.id,
      )
      region1 = Sivel2Gen::Region.find(6)
      Sivel2Gen::CasoRegion.create(
        caso_id: caso.id,
        region_id: region1.id,
      )
      frontera1 = Sivel2Gen::Frontera.find(1)
      Sivel2Gen::CasoFrontera.create(
        frontera_id: frontera1.id,
        caso_id: caso.id,
      )
      Sivel2Gen::Conscaso.refresca_conscaso
      get caso_path(caso) + ".json"
      puts @response.body
      file = guarda_json(@response.body)
      docu = JSON.parse(File.read(file))
      d12 = JSON.parse(<<EOS)
      {"caso":#{" "}
        {
            "id":155265,
            "titulo": "",
            "hechos":"Paramilitares hirieron con arma de fuego a Kevin Enrique Umaña Morantes, de 18 años de edad, mientras se desplazaba por una calle del barrio Nueva Esperanza, Comuna 5. Según la fuente: “El hecho se presentó el 10 de julio, hacia las 6:00 de la mañana, cuando Umaña Morantes, era perseguido por dos sujetos a bordo de una motocicleta, al percatarse del hecho se refugió una vivienda a donde ingresaron los agresores y le propinaron dos impactos de arma de fuego. La zona tiene presencia de grupos posdesmovilización que se disputan el control territorial”.",
            "fecha": "2018-01-01",
            "departamento": "Valle del Cauca",
            "municipio": "Buenaventura",
            "centro_poblado": "San José",
            "lugar": "VEREDA EL PAPAYO",
            "presponsables":
              {
                "14":"Paramilitares"
              },
            "victimas":#{" "}
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
      puts "json_ob=#{json_ob}"
      puts "json_es=#{json_es}"

      assert(JsonUtilities.compare_json(json_ob, json_es), "Fallas en la comparación")
    end
  end
end
