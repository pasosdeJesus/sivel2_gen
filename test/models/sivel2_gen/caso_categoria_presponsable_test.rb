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
        id_caso: caso.id,
        id_presponsable: presponsable.id,
        tipo: 0,
      )
      assert_predicate cp, :valid?

      cat = Categoria.create(PRUEBA_CATEGORIA)
      assert_predicate cat, :valid?

      ccp = CasoCategoriaPresponsable.create(
        id_categoria: cat.id,
        id_caso_presponsable: cp.id
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
