# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoCategoriaPresponsableTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      presponsable = Presponsable.create(PRUEBA_PRESPONSABLE)
      assert presponsable.valid?

      caso = Caso.create(PRUEBA_CASO)
      assert caso.valid?

      cp = CasoPresponsable.create(
        caso_id: caso.id,
        presponsable_id: presponsable.id,
        tipo: 0,
      )
      assert_predicate cp, :valid?

      cat = Categoria.create(PRUEBA_CATEGORIA)
      assert_predicate cat, :valid?

      ccp = CasoCategoriaPresponsable.create(
        categoria_id: cat.id,
        caso_presponsable_id: cp.id
      )
      assert_predicate ccp, :valid?

      ccp.destroy
      cat.destroy
      cp.destroy
      caso.destroy
      presponsable.destroy
    end

    test "no valido" do
      cs = CasoPresponsable.create

      assert_not cs.valid?
    end
  end
end
