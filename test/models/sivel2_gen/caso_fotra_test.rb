# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoFotraTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      fotra = Sivel2Gen::Fotra.create(PRUEBA_FOTRA)

      assert fotra.valid?

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      cf = Sivel2Gen::CasoFotra.create(
        nombre: "x",
        caso_id: caso.id,
        fotra_id: fotra.id,
        fecha: "2023-01-11",
      )

      assert cf.valid?

      cf.destroy
      caso.destroy
      fotra.destroy
    end

    test "no valido" do
      cf = Sivel2Gen::CasoFotra.create

      assert_not cf.valid?
    end
  end
end
