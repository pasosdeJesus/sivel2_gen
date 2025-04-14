# frozen_string_literal: true

require "test_helper"

module Msip
  class ControlAccesoOrgsocialesControllerTest < ActionDispatch::IntegrationTest
    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      if ENV["CONFIG_HOSTS"] != "www.example.com"
        raise "CONFIG_HOSTS debe ser www.example.com"
      end

      Rails.application.try(:reload_routes_unless_loaded)
      @gupoper = Msip::Grupoper.create!(PRUEBA_GRUPOPER)
      @orgsocial = Msip::Orgsocial.create!(PRUEBA_ORGSOCIAL)
    end

    # No autenticado
    ################

    test "sin autenticar no debe presentar listado" do
      assert_raise CanCan::AccessDenied do
        get msip.orgsociales_path
      end
    end

    test "sin autenticar no debe presentar resumen de existente" do
      assert_raise CanCan::AccessDenied do
        get msip.orgsocial_path(@orgsocial.id)
      end
    end

    test "sin autenticar no debe ver formulario de nuevo" do
      assert_raise CanCan::AccessDenied do
        get msip.new_orgsocial_path
      end
    end

    test "sin autenticar no debe crear" do
      assert_raise CanCan::AccessDenied do
        post msip.orgsociales_path, params: {
          orgsocial: {
            id: nil,
            grupoper_attributes: {
              id: nil,
              nombre: "ZZ",
            },
          },
        }
      end
    end

    test "sin autenticar no debe editar" do
      assert_raise CanCan::AccessDenied do
        get msip.edit_orgsocial_path(@orgsocial.id)
      end
    end

    test "sin autenticar no debe actualizar" do
      assert_raise CanCan::AccessDenied do
        patch msip.orgsocial_path(@orgsocial.id)
      end
    end

    test "sin autenticar no debe eliminar" do
      assert_raise CanCan::AccessDenied do
        delete msip.orgsocial_path(@orgsocial.id)
      end
    end

    # Autenticado como operador
    ###########################

    test "autenticado como operador debe presentar listado" do
      skip
      current_usuario = Usuario.find_by(nusuario: "operador")
      sign_in current_usuario
      get msip.orgsociales_path

      assert_response :ok
    end
    #
    #    test "autenticado como operador debe presentar resumen" do
    #      current_usuario = Usuario.create!(PRUEBA_USUARIO_OP)
    #      sign_in current_usuario
    #      get msip.orgsocial_path(@orgsocial.id)
    #      assert_response :ok
    #    end
    #
    #    test "autenticado como operador debería poder editar" do
    #      current_usuario = Usuario.create!(PRUEBA_USUARIO_OP)
    #      sign_in current_usuario
    #      get msip.edit_orgsocial_path(@orgsocial.id)
    #    end
    #
    #    test "autenticaodo como operador no debe eliminar" do
    #      assert_raise CanCan::AccessDenied do
    #        delete msip.orgsocial_path(@orgsocial.id)
    #      end
    #    end
    #
  end
end
