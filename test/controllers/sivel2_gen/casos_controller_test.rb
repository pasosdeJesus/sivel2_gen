
require_relative '../../test_helper'

module Sivel2Gen
  class CasosControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      Rails.application.try(:reload_routes_unless_loaded)

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

    test "new: asigna un nuevo caso como @caso" do
      get new_caso_url
      assert_response :redirect
      @response.redirect_url =~ /casos\/([0-9]*)\/edita/
      ncaso = $~[1].to_i
      assert_redirected_to controller: "casos", action: :edit, id: ncaso
      follow_redirect!
      assert_select "form" do
        assert_select("input#caso_fecha[name=?]", "caso[fecha]")
        assert_select("textarea#caso_memo[name=?]", "caso[memo]")
        # verifica_formulario
      end
    end

    test "get edit: asigna el caso requerida como @caso" do
      caso = Caso.create! PRUEBA_CASOV
      get edit_caso_url(caso)
      assert_response :success
      assert_select "form[action=?][method=?]",
        caso_path(caso),
        "post" do
          assert_select("input#caso_fecha[name=?]", "caso[fecha]")
          assert_select("textarea#caso_memo[name=?]", "caso[memo]")
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
      post crear_caso_fuenteprensa_path(@caso, cf, format: :turbo_stream)
      assert_response :success
      cf.destroy
      @caso.destroy
      fuenteprensa.destroy
    end

    test "elimina fuente de prensa con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      fuenteprensa = Msip::Fuenteprensa.take
      caso_fuenteprensa = Sivel2Gen::CasoFuenteprensa.create(
        fuenteprensa_id: fuenteprensa.id,
        caso_id: @caso.id 
      )
      delete eliminar_caso_fuenteprensa_path(id: caso_fuenteprensa.id, index: 0)
      assert_response :success
      @caso.destroy
    end

    test "agrega otrafuente con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      cof = Sivel2Gen::CasoFotra.create(
        caso_id: @caso.id,
        nombre: "otra fuente",
        fecha: '2023-01-11',
      )
      post crear_caso_fotra_path(@caso, cof, format: :turbo_stream)
      assert_response :success
      cof.destroy
      @caso.destroy
    end

    test "elimina otra fuente de prensa con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      fotra = Sivel2Gen::Fotra.create(
        PRUEBA_FOTRA)
      caso_fotra = Sivel2Gen::CasoFotra.create(
        fotra_id: fotra.id,
        caso_id: @caso.id 
      )
      delete eliminar_caso_fotra_path(id: caso_fotra.id, index: 0)
      assert_response :success
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
      post crear_caso_fotra_path(@caso, cof, format: :turbo_stream)
      assert_response :success
      cof.destroy
      @caso.destroy
    end

    test "elimina presponsable con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      pr = Sivel2Gen::Presponsable.take
      cpr = Sivel2Gen::CasoPresponsable.create(
        caso_id: @caso.id,
        presponsable_id: pr.id,
        tipo: 0
      )
      delete eliminar_caso_presponsable_path(
        id: cpr.id, index: 0)
      assert_response :success
      @caso.destroy
    end

    test "agrega victima con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      persona = Msip::Persona.create(
        PRUEBA_PERSONA 
      )
      post crear_victima_path(caso: @caso, 
        index: @caso.victima.size, format: :turbo_stream)
      assert_response :success
      @caso.destroy
      persona.destroy
    end

    test "elimina victima con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      persona = Msip::Persona.create(
        PRUEBA_PERSONA 
      )
      vic = Sivel2Gen::Victima.create(
        persona_id: persona.id,
        caso_id: @caso.id 
      )
      delete eliminar_victima_path(id: vic.id, index: 0)
      assert_response :success
      @caso.destroy
    end

    test "agrega victimacolectiva con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      post crear_victimacolectiva_path(caso: @caso, 
        index: @caso.victimacolectiva.size, format: :turbo_stream)
      assert_response :success
      @caso.destroy
    end

    test "elimina victimacolectiva con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      grupoper = Msip::Grupoper.create(
        PRUEBA_GRUPOPER 
      )
      vicol = Sivel2Gen::Victimacolectiva.create(
        grupoper_id: grupoper.id,
        caso_id: @caso.id 
      )
      delete eliminar_victimacolectiva_path(id: vicol.id, index: 0)
      assert_response :success
      @caso.destroy
      grupoper.destroy
    end

    test "agrega familiar con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      post crear_familiar_path(caso: @caso, 
        index: 0, format: :turbo_stream)
      assert_response :success
      @caso.destroy
    end

    test "elimina familiar con turbo" do
      persona1 = Msip::Persona.create(
        PRUEBA_PERSONA 
      )
      persona2 = Msip::Persona.create(
        PRUEBA_PERSONA 
      )
      ptr = Msip::PersonaTrelacion.create(
        persona1: persona1,
        persona2: persona2 
      )
      delete eliminar_familiar_path(id: ptr.id, index: 0)
      assert_response :success
    end

    test "agrega anexo con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      anexo = Msip::Anexo.create(
        PRUEBA_ANEXO
      )
      caso_anexo = Sivel2Gen::AnexoCaso.create(
        caso_id: @caso.id,
        anexo_id: anexo.id
      )
      post crear_anexo_caso_path(@caso, caso_anexo, format: :turbo_stream)
      assert_response :success
      @caso.destroy
      anexo.destroy
    end

    test "elimina anexo con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      anexo = Msip::Anexo.create(
        PRUEBA_ANEXO
      )
      anexo_caso = Sivel2Gen::AnexoCaso.create(
        caso_id: @caso.id,
        anexo_id: anexo.id
      )
      delete eliminar_anexo_caso_path(
        id: anexo_caso.id, index: 0)
      assert_response :success
      @caso.destroy
    end

    test "agrega etiqueta con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      etiqueta = Msip::Etiqueta.take
      caso_etiqueta = Sivel2Gen::CasoEtiqueta.create(
        caso_id: @caso.id,
        etiqueta_id: etiqueta.id
      )
      post crear_caso_etiqueta_path(@caso, caso_etiqueta, format: :turbo_stream)
      assert_response :success
      @caso.destroy
    end

    test "elimina etiqueta con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      etiqueta = Msip::Etiqueta.take
      caso_etiqueta = Sivel2Gen::CasoEtiqueta.create(
        caso_id: @caso.id,
        etiqueta_id: etiqueta.id
      )
      delete eliminar_caso_etiqueta_path(id: caso_etiqueta.id, index: 0)
      assert_response :success
      @caso.destroy
    end

    test "agrega solicitud con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      solicitud = Msip::Solicitud.create(
        PRUEBA_SOLICITUD
      )
      caso_solicitud = Sivel2Gen::CasoSolicitud.create(
        caso_id: @caso.id,
        solicitud_id: solicitud.id
      )
      post crear_caso_solicitud_path(@caso, caso_solicitud, format: :turbo_stream)
      assert_response :success
      @caso.destroy
    end

    test "eliminar solicitud con turbo" do
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      assert @caso.valid?
      solicitud = Msip::Solicitud.create(
        PRUEBA_SOLICITUD
      )
      caso_solicitud = Sivel2Gen::CasoSolicitud.create(
        caso_id: @caso.id,
        solicitud_id: solicitud.id
      )
      delete eliminar_caso_solicitud_path(id: caso_solicitud.id, index: 0)
      assert_response :success
      @caso.destroy
    end

  end
end
