# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  module Admin
    class IglesiasControllerTest < ActionDispatch::IntegrationTest
      IGLESIA_NUEVO = {
        created_at: "2021-07-29",
        fechacreacion: "2021-07-29",
        fechadeshabilitacion: nil,
        nombre: "X",
        observaciones: "y",
        updated_at: "2021-07-18",
      }

      IDEX = 10

      include Rails.application.routes.url_helpers
      include Devise::Test::IntegrationHelpers

      setup do
        if ENV["CONFIG_HOSTS"] != "www.example.com"
          raise "CONFIG_HOSTS debe ser www.example.com"
        end

        @current_usuario = ::Usuario.find(1)
        sign_in @current_usuario
      end

      # Cada prueba se ejecuta se hace en una transacción
      # que después de la prueba se revierte

      test "debe presentar listado" do
        get sivel2_gen.admin_iglesias_path

        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_iglesia_url(Iglesia.find(IDEX))

        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_iglesia_path

        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference("Iglesia.count") do
          post sivel2_gen.admin_iglesias_path, params: {
            iglesia: IGLESIA_NUEVO,
          }
        end

        assert_redirected_to sivel2_gen.admin_iglesia_path(
          assigns(:iglesia),
        )
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_iglesia_path(Iglesia.find(IDEX)),
          params: { iglesia: { nombre: "YY" } }

        assert_redirected_to sivel2_gen.admin_iglesia_path(
          assigns(:iglesia),
        )
      end

      test "debe eliminar" do
        assert_difference("Iglesia.count", -1) do
          delete sivel2_gen.admin_iglesia_url(Iglesia.find(IDEX))
        end

        assert_redirected_to sivel2_gen.admin_iglesias_path
      end
    end
  end
end
