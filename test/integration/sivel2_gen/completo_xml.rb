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
        caso_id: caso.id,
        tsitio_id: 3,
        pais_id: 170,
        departamento_id: 47,
        municipio_id: 86,
        clase_id: 11_737,
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
      organizacion1 = Sivel2Gen::Organizacion.find(1)
      organizacion2 = Sivel2Gen::Organizacion.find(2)
      antecedente1 = Sivel2Gen::Antecedente.find(1)
      antecedente2 = Sivel2Gen::Antecedente.find(2)
      sectorsocialsec1 = Sivel2Gen::Sectorsocial.find(1)
      sectorsocialsec2 = Sivel2Gen::Sectorsocial.find(2)

      victima1 = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona1.id,
        etnia_id: 5,
        iglesia_id: nil,
        rangoedad_id: rangoedad.id
      )
      victima2 = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona2.id,
        rangoedad_id: rangoedad.id,
        etnia_id: 5,
        iglesia_id: nil,
        orientacionsexual: 'S'
      )
      victima3 = Sivel2Gen::Victima.create(
        caso_id: caso.id,
        persona_id: persona3.id,
        rangoedad_id: rangoedad.id,
        etnia_id: 5,
        iglesia_id: nil,
        orientacionsexual: 'S'
      )
      otrasorg1 = Sivel2Gen::OtraorgaVictima.create(
        organizacion_id: organizacion1.id, victima_id: victima1.id)
      otrasorg2 = Sivel2Gen::OtraorgaVictima.create(
        organizacion_id: organizacion2.id, victima_id: victima1.id)
      antecedentevic1 = Sivel2Gen::AntecedenteVictima.create(
        antecedente_id: antecedente1.id, victima_id: victima1.id)
      antecedentevic2 = Sivel2Gen::AntecedenteVictima.create(
        antecedente_id: antecedente2.id, victima_id: victima1.id)
      sectorsocialsecvic1 = Sivel2Gen::SectorsocialsecVictima.create(
        sectorsocial_id: sectorsocialsec1.id, victima_id: victima1.id)
      sectorsocialsecvic2 = Sivel2Gen::SectorsocialsecVictima.create(
        sectorsocial_id: sectorsocialsec2.id, victima_id: victima1.id)
      presponsable = Sivel2Gen::Presponsable.find(37)
      pr = Sivel2Gen::CasoPresponsable.create(
        caso_id: caso.id,
        presponsable_id: presponsable.id,
        tipo: 1
      )
      pr.save!
      grupoper = Msip::Grupoper.create! PRUEBA_GRUPOPER
      victimacolectiva1 = Sivel2Gen::Victimacolectiva.create PRUEBA_VICTIMACOLECTIVA
      victimacolectiva1.grupoper_id = grupoper.id
      victimacolectiva1.caso_id = caso.id
      victimacolectiva1.save!
      re = Sivel2Gen::RangoedadVictimacolectiva.new
      re.rangoedad_id = Sivel2Gen::Rangoedad.find(1).id
      re.victimacolectiva_id = victimacolectiva1.id
      re.save!
      re2 = Sivel2Gen::RangoedadVictimacolectiva.new
      re2.rangoedad_id = Sivel2Gen::Rangoedad.find(2).id
      re2.victimacolectiva_id = victimacolectiva1.id
      re2.save!

      fv = Sivel2Gen::FiliacionVictimacolectiva.new
      fv.filiacion_id = Sivel2Gen::Filiacion.find(1).id
      fv.victimacolectiva_id = victimacolectiva1.id
      fv.save!
      fv2 = Sivel2Gen::FiliacionVictimacolectiva.new
      fv2.filiacion_id = Sivel2Gen::Filiacion.find(2).id
      fv2.victimacolectiva_id = victimacolectiva1.id
      fv2.save!

      orgv = Sivel2Gen::OrganizacionVictimacolectiva.new
      orgv.organizacion_id = Sivel2Gen::Organizacion.find(1).id
      orgv.victimacolectiva_id = victimacolectiva1.id
      orgv.save!
      orgv2 = Sivel2Gen::OrganizacionVictimacolectiva.new
      orgv2.organizacion_id = Sivel2Gen::Organizacion.find(2).id
      orgv2.victimacolectiva_id = victimacolectiva1.id
      orgv2.save!

      ss = Sivel2Gen::SectorsocialVictimacolectiva.new
      ss.sectorsocial_id = Sivel2Gen::Sectorsocial.find(1).id
      ss.victimacolectiva_id = victimacolectiva1.id
      ss.save!
      ss2 = Sivel2Gen::SectorsocialVictimacolectiva.new
      ss2.sectorsocial_id = Sivel2Gen::Sectorsocial.find(2).id
      ss2.victimacolectiva_id = victimacolectiva1.id
      ss2.save!

      pr = Sivel2Gen::ProfesionVictimacolectiva.new
      pr.profesion_id = Sivel2Gen::Profesion.find(1).id
      pr.victimacolectiva_id = victimacolectiva1.id
      pr.save!
      pr2 = Sivel2Gen::ProfesionVictimacolectiva.new
      pr2.profesion_id = Sivel2Gen::Profesion.find(2).id
      pr2.victimacolectiva_id = victimacolectiva1.id
      pr2.save!

      ve = Sivel2Gen::VictimacolectivaVinculoestado.new
      ve.vinculoestado_id = Sivel2Gen::Vinculoestado.find(1).id
      ve.victimacolectiva_id = victimacolectiva1.id
      ve.save!
      ve2 = Sivel2Gen::VictimacolectivaVinculoestado.new
      ve2.vinculoestado_id = Sivel2Gen::Vinculoestado.find(2).id
      ve2.victimacolectiva_id = victimacolectiva1.id
      ve2.save!

      vant = Sivel2Gen::AntecedenteVictimacolectiva.new
      vant.antecedente_id = Sivel2Gen::Antecedente.find(1).id
      vant.victimacolectiva_id = victimacolectiva1.id
      vant.save!
      vant2 = Sivel2Gen::AntecedenteVictimacolectiva.new
      vant2.antecedente_id = Sivel2Gen::Antecedente.find(2).id
      vant2.victimacolectiva_id = victimacolectiva1.id
      vant2.save!

      vetn = Sivel2Gen::EtniaVictimacolectiva.new
      vetn.etnia_id = Sivel2Gen::Etnia.find(1).id
      vetn.victimacolectiva_id = victimacolectiva1.id
      vetn.save!
      vetn2 = Sivel2Gen::EtniaVictimacolectiva.new
      vetn2.etnia_id = Sivel2Gen::Etnia.find(2).id
      vetn2.victimacolectiva_id = victimacolectiva1.id
      vetn2.save!

      categoria1 = Sivel2Gen::Categoria.find(97)
      categoria2 = Sivel2Gen::Categoria.find(98)
      acto1 = Sivel2Gen::Acto.create(
        presponsable_id: presponsable.id,
        categoria_id: categoria1.id,
        persona_id: persona1.id,
        caso_id: caso.id,
        created_at: '2019-01-01'
      )
      acto2 = Sivel2Gen::Acto.create(
        presponsable_id: presponsable.id,
        categoria_id: categoria2.id,
        persona_id: persona2.id,
        caso_id: caso.id,
        created_at: '2019-01-01'
      )
      acto3 = Sivel2Gen::Acto.create(
        presponsable_id: presponsable.id,
        categoria_id: categoria2.id,
        persona_id: persona3.id,
        caso_id: caso.id,
        created_at: '2019-01-01'
      )
      intervalo = Sivel2Gen::Intervalo.find(2)
      caso.intervalo_id = intervalo.id
      contexto = Sivel2Gen::Contexto.find(28)
      Sivel2Gen::CasoContexto.create(
        caso_id: caso.id,
        contexto_id: contexto.id,
      )
      region1 = Sivel2Gen::Region.find(9)
      region2 = Sivel2Gen::Region.find(5)
      frontera1 = Sivel2Gen::Frontera.find(1)
      frontera2 = Sivel2Gen::Frontera.find(2)

      Sivel2Gen::CasoRegion.create(
        caso_id: caso.id,
        region_id: region1.id,
      )
      Sivel2Gen::CasoRegion.create(
        caso_id: caso.id,
        region_id: region2.id,
      )
      Sivel2Gen::CasoFrontera.create(
        caso_id: caso.id,
        frontera_id: frontera1.id,
      )
      Sivel2Gen::CasoFrontera.create(
        caso_id: caso.id,
        frontera_id: frontera2.id,
      )
      combatiente = Sivel2Gen::Combatiente.create(
        caso_id: caso.id,
        nombre: "Juan",
        alias: "Reyes",
        edad: 45,
        sexo: "F",
        resagresion_id: 2,
        profesion_id: 16,
        rangoedad_id: 3,
        sectorsocial_id: 2,
        organizacion_id: 10,
        vinculoestado_id: 13,
        organizacionarmada: 27,
        antecedente_ids: [6, 4, 2]
      )
      caso.save!
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
      victimacolectiva1.destroy
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
