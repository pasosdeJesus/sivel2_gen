require 'test_helper'

module Sivel2Gen
  module Admin
    class FiliacionesControllerTest < ActionDispatch::IntegrationTest

      FILIACION_NUEVO = {
        created_at: '2021-07-29',
        fechacreacion: '2021-07-29',
        fechadeshabilitacion: nil,
        nombre: 'X',
        observaciones: 'y',
        updated_at: '2021-07-18'
      }

      IDEX = 3

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
        get sivel2_gen.admin_filiaciones_path
        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_filiacion_url(Filiacion.find(IDEX))
        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_filiacion_path
        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference('Filiacion.count') do
          post sivel2_gen.admin_filiaciones_path, params: { 
            filiacion: FILIACION_NUEVO
          }
        end

        assert_redirected_to sivel2_gen.admin_filiacion_path(
          assigns(:filiacion))
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_filiacion_path(Filiacion.find(IDEX)),
          params: { filiacion: { nombre: 'YY'}}

        assert_redirected_to sivel2_gen.admin_filiacion_path(
          assigns(:filiacion))
      end

      test "debe eliminar" do
        assert_difference('Filiacion.count', -1) do
          delete sivel2_gen.admin_filiacion_url(Filiacion.find(IDEX))
        end

        assert_redirected_to sivel2_gen.admin_filiaciones_path
      end

    end
  end
end
