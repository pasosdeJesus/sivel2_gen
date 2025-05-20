# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoSolicitudTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      solicitud = Msip::Solicitud.create(PRUEBA_SOLICITUD)

      assert_predicate solicitud, :valid?

      caso = Caso.create(PRUEBA_CASO)

      assert_predicate caso, :valid?

      cs = Sivel2Gen::CasoSolicitud.create(
        caso_id: caso.id,
        solicitud_id: solicitud.id,
      )

      assert_predicate cs, :valid?

      caso.destroy
      solicitud.destroy
    end

    test "no valido" do
      cs = Sivel2Gen::CasoSolicitud.create

      assert_not cs.valid?
    end
  end
end
