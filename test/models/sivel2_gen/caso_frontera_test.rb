# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoFronteraTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      frontera = Frontera.create(PRUEBA_FRONTERA)

      assert frontera.valid?

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      cc = Sivel2Gen::CasoFrontera.create(
        caso_id: caso.id,
        frontera_id: frontera.id,
      )

      assert cc.valid?

      caso.destroy
      frontera.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::CasoFrontera.create

      assert_not ap.valid?
    end
  end
end
