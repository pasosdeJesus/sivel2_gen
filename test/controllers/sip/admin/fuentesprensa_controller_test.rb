require 'test_helper'

module Sip
  module Admin
    class FuentesprensaControllerTest < ActionDispatch::IntegrationTest

      FUENTEPRENSA_NUEVO = {
        created_at: '2021-07-29',
        fechacreacion: '2021-07-29',
        fechadeshabilitacion: nil,
        nombre: 'X',
        observaciones: 'y',
        updated_at: '2021-07-18'
      }

      include Rails.application.routes.url_helpers
      include Devise::Test::IntegrationHelpers

      setup  do
        if ENV['CONFIG_HOSTS'] != 'www.example.com'
          raise 'CONFIG_HOSTS debe ser www.example.com'
        end
        @current_usuario = ::Usuario.find(1)
        sign_in @current_usuario
      end

      # Cada prueba se ejecuta se hace en una transacción
      # que después de la prueba se revierte

      test "debe presentar listado" do
        get sip.admin_fuentesprensa_path
        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sip.admin_fuenteprensa_url(Fuenteprensa.find(3))
        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sip.new_admin_fuenteprensa_path
        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference('Fuenteprensa.count') do
          post sip.admin_fuentesprensa_path, params: { 
            fuenteprensa: FUENTEPRENSA_NUEVO
          }
        end

        assert_redirected_to sip.admin_fuenteprensa_path(
          assigns(:fuenteprensa))
      end

      test "debe actualizar existente" do
        patch sip.admin_fuenteprensa_path(Fuenteprensa.find(3)),
          params: { fuenteprensa: { nombre: 'YY'}}

        assert_redirected_to sip.admin_fuenteprensa_path(
          assigns(:fuenteprensa))
      end

      test "debe eliminar" do
        assert_difference('Fuenteprensa.count', -1) do
          delete sip.admin_fuenteprensa_url(Fuenteprensa.find(3))
        end

        assert_redirected_to sip.admin_fuentesprensa_path
      end

    end
  end
end
