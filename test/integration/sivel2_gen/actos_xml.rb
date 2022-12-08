# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class ActosXml < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    PRUEBA_CASO_BASICOS = {
      fecha: '2014-11-19',
      memo: '',
      created_at: '2014-11-11',
      titulo: 'Caso de prueba con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }

    PRUEBA_PRESPONSABLE = {
      id: 1000,
      nombre: 'presunto',
      papa_id: 1000,
      fechacreacion: '2014-09-09',
      created_at: '2014-09-09'
    }

    PRUEBA_TVIOLENCIA = {
      id: 'S',
      nombre: 'VIOLENCIA POLÍTICO SOCIAL',
      nomcorto: 'nombrec',
      fechacreacion: '2014-09-09',
      created_at: '2014-09-09'
    }

    PRUEBA_PERSONA = {
      nombres: 'Nombres',
      apellidos: 'Apellidos',
      anionac: 1974,
      mesnac: 1,
      dianac: 1,
      sexo: 'F',
      id_pais: 170,
      id_departamento: 15,
      id_municipio: 610,
      tdocumento_id: 1,
      numerodocumento: '10000000',
      nacionalde: 170
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
    test 'Valida caso con acto individual' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      categoria = Sivel2Gen::Categoria.find(15)
      presponsable = Sivel2Gen::Presponsable.find(104)
      rangoedad = Sivel2Gen::Rangoedad.create! PRUEBA_RANGOEDAD
      persona = Msip::Persona.create! PRUEBA_PERSONA
      persona.save!
      victima = Sivel2Gen::Victima.create(
        id_caso: caso.id,
        id_persona: persona.id,
        id_etnia: 5,
        id_iglesia: nil,
        id_rangoedad: rangoedad.id
      )
      acto = Sivel2Gen::Acto.create(
        id: 1000,
        id_presponsable: presponsable.id,
        id_categoria: categoria.id,
        id_persona: persona.id,
        id_caso: caso.id,
        created_at: '2014-09-09'
      )
      acto.save!
      get caso_path(caso) + '.xml'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      acto.destroy
      victima.destroy
      caso.destroy
    end

    test 'valida caso con 1 acto colectivo' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO_BASICOS
      ubicaso = Msip::Ubicacion.create(
        id_caso: caso.id,
        id_pais: 170,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      grupoper = Msip::Grupoper.create(
        nombre: 'Nombre de grupo',
        anotaciones: 'Anotaciones de ejemplo',
        created_at: '2014-09-09'
      )
      grupoper.save!
      presponsable = Sivel2Gen::Presponsable.find(104)
      categoria = Sivel2Gen::Categoria.find(15)
      actocolectivo = Sivel2Gen::Actocolectivo.create(
        id_presponsable: presponsable.id,
        id_categoria: categoria.id,
        id_grupoper: grupoper.id,
        id_caso: caso.id,
        created_at: '2014-04-17'
      )
      actocolectivo.save!
      get caso_path(caso) + '.xrlat'
      puts @response.body
      caso.destroy
      grupoper.destroy
      actocolectivo.destroy
    end

  end
end
