# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoUbicacionpreTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      ubicacionpre = Msip::Ubicacionpre.find(1)
      assert_predicate ubicacionpre, :valid?

      caso = Caso.create(PRUEBA_CASO)
      assert_predicate caso, :valid?

      cs = Sivel2Gen::CasoUbicacionpre.create(
        caso_id: caso.id,
        ubicacionpre_id: ubicacionpre.id,
      )
      assert_predicate cs, :valid?

      caso.destroy
      ubicacionpre.destroy
    end

    test "no valido" do
      cs = Sivel2Gen::CasoUbicacionpre.create

      assert_not cs.valid?
    end
  end
end
