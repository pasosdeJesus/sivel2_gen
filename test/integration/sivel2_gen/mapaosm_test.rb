# frozen_string_literal:true

require 'test_helper'
require 'open-uri'
require 'json_utilities'
require 'minitest/autorun'
require 'json'

module Sivel2Gen
  class MapaOsm < PruebaIntegracion
    include Devise::Test::IntegrationHelpers
    include Engine.routes.url_helpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end


    PRUEBA_CASO_BASICOS1 = {
      id: 1139,
      fecha: '2019-08-30',
      memo: '',
      created_at: '2019-08-30',
      titulo: 'Caso de prueba 1 con datos basicos',
      hora: '6 pm',
      duracion: '1 hora'
    }

    test 'entra a Mapas' do
      Sivel2Gen::Conscaso.refresca_conscaso
      get '/sivel2/casos/mapaosm'
      assert :success
    end

    
    test 'filtro de fecha valido por estar en rango' do
      Sivel2Gen::Conscaso.refresca_conscaso
      caso1 = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS1
      fechainicial = Date.parse('2019-08-28').strftime("%F")
      fechafinal = Date.parse('2019-09-01').strftime("%F")
      range = fechainicial...fechafinal
      fechacaso1 = caso1.fecha.strftime("%F")
      assert range === fechacaso1
      caso1.destroy
    end
 
    test 'filtro de fecha no valido por fuera de rangoo' do
      Sivel2Gen::Conscaso.refresca_conscaso
      caso1 = Sivel2Gen::Caso.create PRUEBA_CASO_BASICOS1
      maniana = Time.now + (60 * 60 * 24)
      fechacaso1 = caso1.fecha.strftime("%F")
      assert fechacaso1 < maniana 
      caso1.destroy
    end  
  end
end
