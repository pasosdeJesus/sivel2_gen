require 'test_helper'

module Sivel2Gen
  module Admin
    class TviolenciasControladorPruebas < ActionDispatch::IntegrationTest

      TVIOLENCIA_NUEVO = {
        created_at: '2021-07-29',
        fechacreacion: '2021-07-29',
        fechadeshabilitacion: nil,
        nombre: 'X',
        nomcorto: 'X',
        id: 'X',
        observaciones: 'y',
        updated_at: '2021-07-18'
      }

      IDEX = 'A'

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
        get sivel2_gen.admin_tviolencias_path
        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_tviolencia_url(Tviolencia.find(IDEX))
        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_tviolencia_path
        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference('Tviolencia.count') do
          post sivel2_gen.admin_tviolencias_path, params: { 
            tviolencia: TVIOLENCIA_NUEVO
          }
        end

        assert_redirected_to sivel2_gen.admin_tviolencia_path(
          assigns(:tviolencia))
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_tviolencia_path(Tviolencia.find(IDEX)),
          params: { tviolencia: { nombre: 'YY'}}

        assert_redirected_to sivel2_gen.admin_tviolencia_path(
          assigns(:tviolencia))
      end

      test "debe eliminar" do
        r = Tviolencia.create!(TVIOLENCIA_NUEVO)
        assert_difference('Tviolencia.count', -1) do
          delete sivel2_gen.admin_tviolencia_url(Tviolencia.find(r.id))
        end

        assert_redirected_to sivel2_gen.admin_tviolencias_path
      end

    end
  end
end
