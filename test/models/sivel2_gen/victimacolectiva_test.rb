require 'test_helper'

module Sivel2Gen
  class VictimacolectivaTest < ActiveSupport::TestCase


    test "valido" do
      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)
      assert_predicate grupoper, :valid?

      victimacolectiva = Sivel2Gen::Victimacolectiva.create(
        PRUEBA_VICTIMACOLECTIVA.merge(
          caso_id: caso.id,
          grupoper_id: grupoper.id,
        )
      )
      assert victimacolectiva.valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
    end

    test "no valido" do
      victimacolectiva = Victimacolectiva.new PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: nil
      )
      assert_not victimacolectiva.valid?
    end

  end
end
