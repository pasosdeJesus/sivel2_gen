require 'test_helper'

module Sivel2Gen
  class ActocolectivoTest < ActiveSupport::TestCase


    test "valido" do
      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)
      assert_predicate grupoper, :valid?

      victimacolectiva = Sivel2Gen::Victimacolectiva.create(
        PRUEBA_VICTIMACOLECTIVA.merge(
          id_caso: caso.id,
          id_grupoper: grupoper.id,
        )
      )
      assert victimacolectiva.valid?

      actocolectivo = Actocolectivo.create PRUEBA_ACTOCOLECTIVO.merge(
        id_caso: caso.id,
        id_grupoper: grupoper.id
      )
      assert actocolectivo.valid?

      actocolectivo.destroy
      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
    end

    test "no valido" do
      actocolectivo = Actocolectivo.new PRUEBA_ACTOCOLECTIVO.merge(
        id_caso: nil
      )
      assert_not actocolectivo.valid?
      actocolectivo.destroy
    end

  end
end
