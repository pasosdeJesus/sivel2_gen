# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  module Admin
    class CategoriasControllerTest < ActionDispatch::IntegrationTest
      CATEGORIA_NUEVO = {
        created_at: "2021-07-29",
        fechacreacion: "2021-07-29",
        fechadeshabilitacion: nil,
        id: 1000,
        nombre: "X",
        observaciones: "y",
        supracategoria_id: 1,
        updated_at: "2021-07-18",
      }

      IDEX = 10

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
        get sivel2_gen.admin_categorias_path

        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_categoria_url(Categoria.find(IDEX))

        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_categoria_path

        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference("Categoria.count") do
          post sivel2_gen.admin_categorias_path, params: {
            categoria: CATEGORIA_NUEVO,
          }
        end

        assert_redirected_to sivel2_gen.admin_categoria_path(
          assigns(:categoria),
        )
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_categoria_path(Categoria.find(IDEX)),
          params: { categoria: { nombre: "YY" } }

        assert_redirected_to sivel2_gen.admin_categoria_path(
          assigns(:categoria),
        )
      end

      test "debe eliminar" do
        assert_difference("Categoria.count", -1) do
          delete sivel2_gen.admin_categoria_url(Categoria.find(IDEX))
        end

        assert_redirected_to sivel2_gen.admin_categorias_path
      end
    end
  end
end
