# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoFuenteprensaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      fuenteprensa = Msip::Fuenteprensa.create(PRUEBA_FUENTEPRENSA)
      assert fuenteprensa.valid?

      caso = Caso.create(PRUEBA_CASO)
      assert caso.valid?

      cf = Sivel2Gen::CasoFuenteprensa.create(
        caso_id: caso.id,
        fuenteprensa_id: fuenteprensa.id,
        fecha: '2023-01-11',
      )
      assert_predicate cf, :valid?

      cf.destroy
      caso.destroy
      fuenteprensa.destroy
    end

    test "no valido" do
      cs = Sivel2Gen::CasoFuenteprensa.create

      assert_not cs.valid?
    end
  end
end
