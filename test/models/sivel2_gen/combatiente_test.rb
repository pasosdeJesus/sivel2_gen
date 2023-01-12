require 'test_helper'

module Sivel2Gen
  class CombatienteTest < ActiveSupport::TestCase


    test "valido" do
      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      combatiente = Combatiente.create PRUEBA_COMBATIENTE.merge(
        id_caso: caso.id
      )
      assert combatiente.valid?
      combatiente.destroy
      caso.destroy
    end

    test "no valido" do
      combatiente = Combatiente.new PRUEBA_COMBATIENTE
      assert_not combatiente.valid?
    end

  end
end
