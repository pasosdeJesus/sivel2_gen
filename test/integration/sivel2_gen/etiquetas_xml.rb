# frozen_string_literal:true

require 'test_helper'
require 'nokogiri'
require 'open-uri'

module Sivel2Gen
  class EtiquetasXml < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test 'Valida caso con una etiqueta' do
      caso = Sivel2Gen::Caso.create! PRUEBA_CASO
      ubicaso = Msip::Ubicacion.create(
        caso_id: caso.id,
        pais_id: 170,
        departamento_id: 4,
        created_at: '2019-01-01',
      )
      ubicaso.save!
      caso.ubicacion_id = ubicaso.id
      caso.save!
      etiqueta = Msip::Etiqueta.create(
        id: 1000,
        nombre: 'Etiqueta',
        observaciones: 'obs',
        fechacreacion: '2014-09-09',
        created_at: '2014-09-09'
      )
      casoetiqueta = Sivel2Gen::CasoEtiqueta.create(
        id: 1000,
        caso_id: caso.id,
        etiqueta_id: etiqueta.id,
        usuario_id: @current_usuario.id,
        fecha: '2014-09-09',
        created_at: '2014-09-09'
      )
      get caso_path(caso) + '.xrlat'
      puts @response.body
      file = guarda_xml(@response.body)
      docu = File.read(file)
      verifica_dtd(docu)
      caso.destroy
      etiqueta.destroy
      casoetiqueta.destroy
    end
  end
end
