# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoRespuestaforTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      f = ::Mr519Gen::Formulario.create(PRUEBA_FORMULARIO)

      assert f.valid?
      r = ::Mr519Gen::Respuestafor.create(PRUEBA_RESPUESTAFOR.merge(
        formulario_id: f.id,
      ))

      assert r.valid?
      a = Sivel2Gen::Caso.create(PRUEBA_CASO)

      assert a.valid?

      ar = Sivel2Gen::CasoRespuestafor.create(
        caso_id: a.id,
        respuestafor_id: r.id,
      )

      assert ar.valid?

      a.destroy
      r.destroy
      f.destroy
    end

    test "no valido" do
      aapf = Sivel2Gen::CasoRespuestafor.create

      assert_not aapf.valid?
    end
  end
end
