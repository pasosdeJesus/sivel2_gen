
require_relative '../../test_helper'

module Sivel2Gen
  class CasosControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    PRUEBA_CASOV = {
      fecha: "2014-11-19", 
      memo: "x", 
      created_at: "2014-11-11" 
    }

    PRUEBA_CASONV = { 
      fecha: nil, 
      memo: nil ,
      created_at: "2014-11-11" 
    }

    test "index: asigna todos los casos como @casos" do
      Sivel2Gen::Conscaso.refresca_conscaso
      Caso.create! PRUEBA_CASOV
      Sivel2Gen::Conscaso.refresca_conscaso
      get casos_path
      #debugger
      assert_response :success
      puts @response.body
      assert_select "tr>td", text: '2014-11-19'
    end

    test "show: retorna success" do
      caso = Caso.create! PRUEBA_CASOV
      get caso_path(caso)
      assert_response :success
      puts @response.body
      assert_select  "p", text: /Fecha:[ \n]*2014-11-19[ \n]*SIN INFORMACIÓN/
    end

    def verifica_formulario
      assert_select "input#caso_fecha_localizada[name=?]", "caso[fecha_localizada]"
      assert_select "textarea#caso_memo[name=?]", "caso[memo]"
    end

    test "new: asigna un nuevo caso como @caso" do
      get new_caso_url
      assert_response :redirect
      @response.redirect_url =~ /casos\/([0-9]*)\/edita/
      ncaso = $~[1].to_i
      assert_redirected_to controller: "casos", action: :edit, id: ncaso
      follow_redirect!
      assert_select 'form' do
        verifica_formulario
      end
    end

    test "get edit: asigna el caso requerida como @caso" do
      caso = Caso.create! PRUEBA_CASOV
      get edit_caso_url(caso)
      assert_response :success
      assert_select "form[action=?][method=?]", 
        caso_path(caso), "post" do
        verifica_formulario
      #  assert_select "input#caso_fecha[name=?]", "caso[fecha]"
      #  assert_select "textarea#caso_memo[name=?]", "caso[memo]"
      end
    end

    test "put update: actualiza el caso requerida" do
      skip
      caso = Caso.create! PRUEBA_CASOV
      patch caso_url(caso), params: {
        caso: {
          fecha: "2014-11-18", 
          memo: "memo2", 
          created_at: "2014-11-18" 
        }
      }
      caso.reload
      assert_equal "memo2", caso.memo
    end

    test "update: asigna el caso requerida como @caso" do
      skip
      caso = Caso.create! PRUEBA_CASOV
      patch caso_url(caso), params: {
        caso: PRUEBA_CASOV
      }
      assert_redirected_to caso_url(caso)
    end

    test "update: redirige al caso" do
      skip
      caso = Caso.create! PRUEBA_CASOV
      patch caso_url(caso), params: {:id => caso.to_param, 
                                    :caso => PRUEBA_CASOV}
      assert_redirected_to caso_url(caso)
    end

    test "update: vuelve a presentar la plantilla 'editar'" do
      skip
      caso = Caso.create! PRUEBA_CASOV
      patch caso_url(caso), params: {
        caso: PRUEBA_CASONV
      }
      assert_response :success
    end

    test "delete: elimina el caso requerida" do
      skip
      caso = Caso.create! PRUEBA_CASOV
      assert_difference('Sivel2Gen::Caso.count', -1) do
        delete caso_url(caso)
      end
    end

    test "redirige a la lista de casos" do
      skip
      caso = Caso.create! PRUEBA_CASOV
      delete caso_url(caso)
      assert_redirected_to casos_url
    end

    test "agrega fuente de prensa con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      fuenteprensa = Msip::Fuenteprensa.create(PRUEBA_FUENTEPRENSA)
      assert fuenteprensa.valid?
      cf = Sivel2Gen::CasoFuenteprensa.create(
        caso_id: @caso.id,
        fuenteprensa_id: fuenteprensa.id,
        fecha: '2023-01-11',
      )
      post casos_fuenteprensa_path(@caso, cf, format: :turbo_stream)
      assert_response :success
      cf.destroy
      @caso.destroy
      fuenteprensa.destroy
    end

    test "agrega otrafuente con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      cof = Sivel2Gen::CasoFotra.create(
        caso_id: @caso.id,
        nombre: "otra fuente",
        fecha: '2023-01-11',
      )
      post casos_fotra_path(@caso, cof, format: :turbo_stream)
      assert_response :success
      cof.destroy
      @caso.destroy
    end

    test "agrega presponsable con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      pr = Sivel2Gen::Presponsable.take
      cof = Sivel2Gen::CasoPresponsable.create(
        caso_id: @caso.id,
        presponsable_id: pr.id,
        tipo: 0
      )
      post casos_fotra_path(@caso, cof, format: :turbo_stream)
      assert_response :success
      cof.destroy
      @caso.destroy
    end
  end
end
