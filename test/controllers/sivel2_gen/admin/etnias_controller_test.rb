require 'test_helper'

module Sivel2Gen
  module Admin
    class EtniasControllerTest < ActionDispatch::IntegrationTest

      ETNIA_NUEVO = {
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
        get sivel2_gen.admin_etnias_path
        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_etnia_url(Etnia.find(IDEX))
        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_etnia_path
        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference('Etnia.count') do
          post sivel2_gen.admin_etnias_path, params: { 
            etnia: ETNIA_NUEVO
          }
        end

        assert_redirected_to sivel2_gen.admin_etnia_path(
          assigns(:etnia))
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_etnia_path(Etnia.find(IDEX)),
          params: { etnia: { nombre: 'YY'}}

        assert_redirected_to sivel2_gen.admin_etnia_path(
          assigns(:etnia))
      end

      test "debe eliminar" do
        assert_difference('Etnia.count', -1) do
          delete sivel2_gen.admin_etnia_url(Etnia.find(IDEX))
        end

        assert_redirected_to sivel2_gen.admin_etnias_path
      end

    end
  end
end
