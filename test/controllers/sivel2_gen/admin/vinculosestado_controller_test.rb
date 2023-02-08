
require_relative "../../../test_helper"

module Sivel2Gen
  class VinculoestadoControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers  
    include Devise::Test::IntegrationHelpers 

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test "al pedir indice presenta plantilla de indice" do
      get admin_vinculosestado_url
      assert_template "sip/modelos/index"
    end
  end
end
