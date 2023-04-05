# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoPresponsableTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      presponsable = Sivel2Gen::Presponsable.create(PRUEBA_PRESPONSABLE)
      assert presponsable.valid?

      caso = Caso.create(PRUEBA_CASO)
      assert caso.valid?

      cs = Sivel2Gen::CasoPresponsable.create(
        caso_id: caso.id,
        presponsable_id: presponsable.id,
        tipo: 0,
      )
      assert_predicate cs, :valid?

      caso.destroy
      presponsable.destroy
    end

    test "no valido" do
      cs = Sivel2Gen::CasoPresponsable.create

      assert_not cs.valid?
    end
  end
end
