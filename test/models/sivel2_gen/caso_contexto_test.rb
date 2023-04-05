# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoContextoTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      contexto = Contexto.create(PRUEBA_CONTEXTO)

      assert contexto.valid?

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      cc = Sivel2Gen::CasoContexto.create(
        caso_id: caso.id,
        contexto_id: contexto.id,
      )

      assert cc.valid?

      caso.destroy
      contexto.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::CasoContexto.create

      assert_not ap.valid?
    end
  end
end
