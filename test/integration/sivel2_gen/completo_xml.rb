# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'
require 'compare-xml'

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
      id: 158_409,
      fecha: '2018-01-01',
      memo: 'En la vereda El Papayo, zona rural de Buenaventura, se registró una explosión que dejó un menor muerto y otros tres heridos. Los cuatro menores se desplazaban en una pequeña canoa hacia uno de los extremos del río Yurumanguí y resultaron gravemente heridos, luego de que encontraron en la orilla, un artefacto que les explotó al manipularlo. Según el padre de uno de los menores, Serapio Mosquera, son niños de una sola familia, yo estaba en la casa cuando ellos se fueron, luego escuchamos la explosión. Mosquera afirmó que uno de los niños, de siete años, murió, lo íbamos a traer para Buenaventura pero no alcanzamos, lo dejamos allá porque ya para qué lo traíamos. Uno de los menores que resultó con heridas leves fue dejado en la zona, mientras que en una embarcación, trasladaron a dos de los niños heridos, ambos de 12 años de edad. Uno de los menores fue dado de alta, pero él otro está bajo pronóstico reservado, tiene heridas muy graves en el abdomen explicó Marta Isabel Valencia, directora médica de la Clínica Santa Sofía de Buenaventura. Los médicos adelantan las gestiones para trasladar al menor a una clínica de mayor complejidad en Cali. El comandante de la Policía de Buenaventura, coronel Jorge Cabra, dijo que conformamos un equipo de trabajo con la Infantería de Marina, la Sijin, pero no se encontró ningún elemento que nos confirmara la versión de la persona que trajo a los menores a la clínica, la comunidad tampoco entrega mayor información sobre el hecho.',
      created_at: '2014-11-11',
      titulo: 'NIÑOS AFECTADOS POR EXPLOSIÓN DE GRANADA'
    }
 
    PRUEBA_PERSONA1 = {
      id: 249_236,
      nombres: 'N',
      apellidos: 'N',
      anionac: 2006,
      mesnac: '06',
      dianac: '15',
      sexo: 'S'
    }

    PRUEBA_PERSONA2 = {
      id: 249_237,
      nombres: 'N',
      apellidos: 'N',
      anionac: 2006,
      mesnac: '06',
      dianac: '15',
      sexo: 'S'
    }

    PRUEBA_PERSONA3 = {
      id: 249_238,
      nombres: 'N',
      apellidos: 'N',
      anionac: 2011,
      mesnac: '06',
      dianac: '15',
      sexo: 'S'
    }

    test 'Valida caso de prueba como uno de sivel12' do
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
      persona2 =  Msip::Persona.create! PRUEBA_PERSONA2
      persona3 =  Msip::Persona.create! PRUEBA_PERSONA3
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
      victima2 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona2.id,
        id_rangoedad: rangoedad.id,
        id_etnia: 5,
        id_iglesia: nil,
        orientacionsexual: 'S'
      )
      victima3 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona3.id,
        id_rangoedad: rangoedad.id,
        id_etnia: 5,
        id_iglesia: nil,
        orientacionsexual: 'S'
      )
      presponsable = Sivel2Gen::Presponsable.find(37)
      pr = Sivel2Gen::CasoPresponsable.create(
        id_caso: caso.id,
        id_presponsable: presponsable.id,
        tipo: 1
      )
      pr.save!
      categoria1 = Sivel2Gen::Categoria.find(97)
      categoria2 = Sivel2Gen::Categoria.find(98)
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
        id_persona: persona2.id,
        id_caso: caso.id,
        created_at: '2019-01-01'
      )
      acto3 = Sivel2Gen::Acto.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria2.id,
        id_persona: persona3.id,
        id_caso: caso.id,
        created_at: '2019-01-01'
      )
      intervalo = Sivel2Gen::Intervalo.find(2)
      caso.id_intervalo = intervalo.id
      contexto = Sivel2Gen::Contexto.find(28)
      Sivel2Gen::CasoContexto.create(
        id_caso: caso.id,
        id_contexto: contexto.id,
      )
      region1 = Sivel2Gen::Region.find(9)
      region2 = Sivel2Gen::Region.find(5)
      Sivel2Gen::CasoRegion.create(
        id_caso: caso.id,
        id_region: region1.id,
      )
      Sivel2Gen::CasoRegion.create(
        id_caso: caso.id,
        id_region: region2.id,
      )
      combatiente = Sivel2Gen::Combatiente.create(
        id_caso: caso.id,
        nombre: "Juan",
        alias: "Reyes",
        edad: 45,
        sexo: "F",
        id_resagresion: 2,
        id_profesion: 16,
        id_rangoedad: 3,
        id_sectorsocial: 2,
        id_organizacion: 10,
        id_vinculoestado: 13,
        organizacionarmada: 27,
        antecedente_ids: [6, 4, 2]
      )
      get caso_path(caso) + '.xrlat'
      d12 = 'test/dummy/public/relatos_ref.xrlat'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(File.open(d12))
      verifica_dtd(docu)
      compara(docu, d12)
      ubicaso.destroy
      caso.destroy
      combatiente.destroy
      acto1.destroy
      acto2.destroy
      acto3.destroy
      persona1.destroy
      persona2.destroy
      persona3.destroy
      rangoedad.destroy
      profesion.destroy
      sectorsocial.destroy
      victima1.destroy
      victima2.destroy
      victima3.destroy
    end

    def compara(doc2, doc12)
      doc1 = Nokogiri::XML(doc2)
      doc2 = Nokogiri::XML(File.open(doc12))
      puts CompareXML.equivalent?(
        doc1, doc2, ignore_comments: false, verbose: true
      )
      assert CompareXML.equivalent?(
        doc1, doc2, ignore_comments: false, verbose: true
      )
    end
  end
end
