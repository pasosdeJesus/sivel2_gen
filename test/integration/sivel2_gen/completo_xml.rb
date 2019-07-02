# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'
require 'compare-xml'

module Sivel2Gen
  class PersonasXml < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
      @routes = Engine.routes
    end

    PRUEBA_CASO_BASICOS = {
      id: 158409,
      fecha: '2018-01-01',
      memo: 'En la vereda El Papayo, zona rural de Buenaventura, se registró una explosión que dejó un menor muerto y otros tres heridos. Los cuatro menores se desplazaban en una pequeña canoa hacia uno de los extremos del río Yurumanguí y resultaron gravemente heridos, luego de que encontraron en la orilla, un artefacto que les explotó al manipularlo. Según el padre de uno de los menores, Serapio Mosquera, son niños de una sola familia, yo estaba en la casa cuando ellos se fueron, luego escuchamos la explosión. Mosquera afirmó que uno de los niños, de siete años, murió, lo íbamos a traer para Buenaventura pero no alcanzamos, lo dejamos allá porque ya para qué lo traíamos. Uno de los menores que resultó con heridas leves fue dejado en la zona, mientras que en una embarcación, trasladaron a dos de los niños heridos, ambos de 12 años de edad. Uno de los menores fue dado de alta, pero él otro está bajo pronóstico reservado, tiene heridas muy graves en el abdomen explicó Marta Isabel Valencia, directora médica de la Clínica Santa Sofía de Buenaventura. Los médicos adelantan las gestiones para trasladar al menor a una clínica de mayor complejidad en Cali. El comandante de la Policía de Buenaventura, coronel Jorge Cabra, dijo que conformamos un equipo de trabajo con la Infantería de Marina, la Sijin, pero no se encontró ningún elemento que nos confirmara la versión de la persona que trajo a los menores a la clínica, la comunidad tampoco entrega mayor información sobre el hecho.',
      created_at: '2014-11-11',
      titulo: 'NIÑOS AFECTADOS POR EXPLOSIÓN DE GRANADA',
    }
 
    PRUEBA_PERSONA1 = {
        id: 249236,
        nombres: 'N'.freeze,
        apellidos: 'N'.freeze,
        anionac: 2006,
        mesnac: '06'.freeze,
        dianac: '15'.freeze,
        sexo: 'S'.freeze
     }
    PRUEBA_PERSONA2 = {
        id: 249237,
        nombres: 'N'.freeze,
        apellidos: 'N'.freeze,
        anionac: 2006,
        mesnac: '06'.freeze,
        dianac: '15'.freeze,
        sexo: 'S'.freeze,
     }
    PRUEBA_PERSONA3 = {
        id: 249238,
        nombres: 'N'.freeze,
        apellidos: 'N'.freeze,
        anionac: 2011,
        mesnac: '06'.freeze,
        dianac: '15'.freeze,
        sexo: 'S'.freeze,
     }
 
    PRUEBA_PROFESION = {
        id: 1000,
        nombre: 'Profesion'.freeze,
        fechacreacion: '2014-09-09'.freeze,
        created_at: '2014-09-09'.freeze
    }

    PRUEBA_RANGOEDAD = {
    	id: 1000,
        nombre: 'De 0 a 15 Años'.freeze,
        rango: '1-2'.freeze,
    	limiteinferior: 1,
    	limitesuperior: 2,
        fechacreacion: '2014-09-09'.freeze,
        created_at: '2014-09-09'.freeze
    }

    PRUEBA_SECTORSOCIAL = {
        id: 1000,
        nombre: 'Pruebaumpleado'.freeze,
        fechacreacion: '2014-09-09'.freeze
    }
 
    test 'Valida caso de prueba como uno de sivel12' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      ubicaso = Sip::Ubicacion.create(
        lugar: 'VEREDA EL PAPAYO',
        sitio: 'UNO DE LOS EXTREMOS DEL RÍO YURUMANGUÍ EN LA RIVERA DEL RÍO',
        id_caso: caso.id,
        id_tsitio: 3,
        id_pais: 170,
        id_departamento: 47,
        id_municipio: 86,
        id_clase: 11737,
        created_at: '2019-01-01'.freeze,
        longitud: -77.0697417935442,
        latitud: 3.89381723858445
      )
      caso.ubicacion_id = ubicaso.id
      persona1 =  Sip::Persona.create! PRUEBA_PERSONA1
      persona2 =  Sip::Persona.create! PRUEBA_PERSONA2
      persona3 =  Sip::Persona.create! PRUEBA_PERSONA3
      rangoedad = Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
      profesion = Sivel2Gen::Profesion.create! PRUEBA_PROFESION
      sectorsocial = Sivel2Gen::Sectorsocial.create! PRUEBA_SECTORSOCIAL
      victima1 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona1.id,
        id_etnia: nil,
        id_iglesia: nil,
        id_rangoedad: rangoedad.id
      )
      victima2 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona2.id,
        id_rangoedad: rangoedad.id,
        id_etnia: nil,
        id_iglesia:nil,
        orientacionsexual: 'S'
      )
      victima3 = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona3.id,
        id_rangoedad: rangoedad.id,
        id_etnia: nil,
        id_iglesia: nil,
        orientacionsexual: 'S')
      presponsable = Sivel2Gen::Presponsable.find(37)
      casopresponsable = Sivel2Gen::CasoPresponsable.create(
        id_caso: caso.id,
        id_presponsable: presponsable.id,
        tipo: 1
      )
      pconsolidado1 = Sivel2Gen::Pconsolidado.find(1)
      pconsolidado1 = Sivel2Gen::Pconsolidado.find(5)
      categoria1 = Sivel2Gen::Categoria.find(97)
      categoria2 = Sivel2Gen::Categoria.find(98)
      acto1 = Sivel2Gen::Acto.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria1.id,
        id_persona: persona1.id,
        id_caso: caso.id,
        created_at: '2019-01-01'.freeze
      )
      acto2 = Sivel2Gen::Acto.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria2.id,
        id_persona: persona2.id,
        id_caso: caso.id,
        created_at: '2019-01-01'.freeze
      )
      acto3 = Sivel2Gen::Acto.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria2.id,
        id_persona: persona3.id,
        id_caso: caso.id,
        created_at: '2019-01-01'.freeze
      )
      intervalo = Sivel2Gen::Intervalo.find(2)
      caso.id_intervalo = intervalo.id
      contexto = Sivel2Gen::Contexto.find(28)
      casocon = Sivel2Gen::CasoContexto.create(
        id_caso: caso.id,
        id_contexto: contexto.id,
        created_at: '2014-09-09'.freeze
      )
      region1 = Sivel2Gen::Region.find(9)
      region2 = Sivel2Gen::Region.find(5)
      casoreg1 = Sivel2Gen::CasoRegion.create(
        id_caso: caso.id,
        id_region: region1.id,
        created_at: '2014-09-09')
      casoreg2 = Sivel2Gen::CasoRegion.create(
        id_caso: caso.id,
        id_region: region2.id,
        created_at: '2014-09-09'.freeze
      )
      get caso_path(caso) + '.xml'
      d12 = 'test/dummy/public/relatos_ref.xrlat'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      compara(docu,d12)
      ubicaso.destroy
      caso.destroy
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
 
    def guarda_xml(docu)
      file = File.new('test/dummy/public/relatos.xrlat', 'wb')
      file.write(docu)
      file.close
      file
    end

    def verifica_dtd(docu)
      options = Nokogiri::XML::ParseOptions::DTDVALID
      doc = Nokogiri::XML::Document.parse(docu, nil, nil, options)
      puts doc.external_subset.validate(doc)
      assert_empty doc.external_subset.validate(doc)
    end

    def compara(doc2, doc12)
      doc1 = Nokogiri::XML(doc2)
      doc2 = Nokogiri::XML(open(doc12))
      puts CompareXML.equivalent?(doc1, doc2, {
        ignore_comments: false,
        verbose: true
      })
      assert_empty CompareXML.equivalent?(doc1, doc2, {
        ignore_comments: false,
        verbose: true
      })
    end
  end
end
