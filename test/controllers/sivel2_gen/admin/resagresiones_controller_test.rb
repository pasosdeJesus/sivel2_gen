# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  module Admin
    class ResagresionesControllerTest < ActionDispatch::IntegrationTest
      RESAGRESION_NUEVO = {
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

        @current_usuario = ::Usuario.find(1)
        sign_in @current_usuario
      end

      # Cada prueba se ejecuta se hace en una transacción
      # que después de la prueba se revierte

      test "debe presentar listado" do
        get sivel2_gen.admin_resagresiones_path

        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_resagresion_url(Resagresion.find(IDEX))

        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_resagresion_path

        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference("Resagresion.count") do
          post sivel2_gen.admin_resagresiones_path, params: {
            resagresion: RESAGRESION_NUEVO,
          }
        end

        assert_redirected_to sivel2_gen.admin_resagresion_path(
          assigns(:resagresion),
        )
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_resagresion_path(Resagresion.find(IDEX)),
          params: { resagresion: { nombre: "YY" } }

        assert_redirected_to sivel2_gen.admin_resagresion_path(
          assigns(:resagresion),
        )
      end

      test "debe eliminar" do
        r = Resagresion.create!(RESAGRESION_NUEVO)
        assert_difference("Resagresion.count", -1) do
          delete sivel2_gen.admin_resagresion_url(Resagresion.find(r.id))
        end

        assert_redirected_to sivel2_gen.admin_resagresiones_path
      end
    end
  end
end
