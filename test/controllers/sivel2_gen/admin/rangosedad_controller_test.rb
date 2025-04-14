# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  module Admin
    class RangosedadControllerTest < ActionDispatch::IntegrationTest
      RANGOEDAD_NUEVO = {
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
        get sivel2_gen.admin_rangosedad_path

        assert_response :success
        assert_template :index
      end

      test "debe presentar resumen de existente" do
        get sivel2_gen.admin_rangoedad_url(Rangoedad.find(IDEX))

        assert_response :success
        assert_template :show
      end

      test "debe presentar formulario para nueva" do
        get sivel2_gen.new_admin_rangoedad_path

        assert_response :success
        assert_template :new
      end

      test "debe crear nueva" do
        assert_difference("Rangoedad.count") do
          post sivel2_gen.admin_rangosedad_path, params: {
            rangoedad: RANGOEDAD_NUEVO,
          }
        end

        assert_redirected_to sivel2_gen.admin_rangoedad_path(
          assigns(:rangoedad),
        )
      end

      test "debe actualizar existente" do
        patch sivel2_gen.admin_rangoedad_path(Rangoedad.find(IDEX)),
          params: { rangoedad: { nombre: "YY" } }

        assert_redirected_to sivel2_gen.admin_rangoedad_path(
          assigns(:rangoedad),
        )
      end

      test "debe eliminar" do
        r = Rangoedad.create!(RANGOEDAD_NUEVO)
        assert_difference("Rangoedad.count", -1) do
          delete sivel2_gen.admin_rangoedad_url(Rangoedad.find(r.id))
        end

        assert_redirected_to sivel2_gen.admin_rangosedad_path
      end
    end
  end
end
