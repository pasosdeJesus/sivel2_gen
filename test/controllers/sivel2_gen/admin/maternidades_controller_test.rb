# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  module Admin
    class MaternidadesControllerTest < ActionDispatch::IntegrationTest
      MATERNIDAD_NUEVO = {
        created_at: "2021-07-29",
        fechacreacion: "2021-07-29",
        fechadeshabilitacion: nil,
        nombre: "X",
        observaciones: "y",
        updated_at: "2021-07-18",
      }

      IDEX = 3

      include Rails.application.routes.url_helpers
      include Devise::Test::IntegrationHelpers

      setup do
        if ENV["CONFIG_HOSTS"] != "www.example.com"
          raise "CONFIG_HOSTS debe ser www.example.com"
        end

        Rails.application.try(:reload_routes_unless_loaded)
        @current_usuario = ::Usuario.find(1)
        sign_in @current_usuario
      end

      # Cada prueba se ejecuta se hace en una transacción
      # que después de la prueba se revierte

      test "debe presentar listado" do
        get sivel2_gen.admin_maternidades_path

        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        skip
        get sivel2_gen.admin_maternidad_url(Maternidad.find(IDEX))

        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_maternidad_path

        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference("Maternidad.count") do
          post sivel2_gen.admin_maternidades_path, params: {
            maternidad: MATERNIDAD_NUEVO,
          }
        end

        assert_redirected_to sivel2_gen.admin_maternidad_path(
          assigns(:maternidad),
        )
      end

      test "debe actualizar existente" do
        skip
        patch sivel2_gen.admin_maternidad_path(Maternidad.find(IDEX)),
          params: { maternidad: { nombre: "YY" } }

        assert_redirected_to sivel2_gen.admin_maternidad_path(
          assigns(:maternidad),
        )
      end

      test "debe eliminar" do
        skip
        assert_difference("Maternidad.count", -1) do
          delete sivel2_gen.admin_maternidad_url(Maternidad.find(IDEX))
        end

        assert_redirected_to sivel2_gen.admin_maternidades_path
      end
    end
  end
end
