# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  module Admin
    class SupracategoriasControllerTest < ActionDispatch::IntegrationTest
      SUPRACATEGORIA_NUEVO = {
        created_at: "2021-07-29",
        fechacreacion: "2021-07-29",
        fechadeshabilitacion: nil,
        tviolencia_id: "C",
        id: 1000,
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
        get sivel2_gen.admin_supracategorias_path

        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_supracategoria_url(Supracategoria.find(IDEX))

        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_supracategoria_path

        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference("Supracategoria.count") do
          post sivel2_gen.admin_supracategorias_path, params: {
            supracategoria: SUPRACATEGORIA_NUEVO,
          }
        end

        assert_redirected_to sivel2_gen.admin_supracategoria_path(
          assigns(:supracategoria),
        )
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_supracategoria_path(Supracategoria.find(IDEX)),
          params: { supracategoria: { nombre: "YY" } }

        assert_redirected_to sivel2_gen.admin_supracategoria_path(
          assigns(:supracategoria),
        )
      end

      test "debe eliminar" do
        r = Supracategoria.create!(SUPRACATEGORIA_NUEVO)
        assert_difference("Supracategoria.count", -1) do
          delete sivel2_gen.admin_supracategoria_url(Supracategoria.find(r.id))
        end

        assert_redirected_to sivel2_gen.admin_supracategorias_path
      end
    end
  end
end
