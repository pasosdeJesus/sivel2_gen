# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class AntecedenteCombatienteAntecedenteTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      antecedente = Antecedente.new(PRUEBA_ANTECEDENTE)
      assert_predicate antecedente, :valid?
      antecedente.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      combatiente = Combatiente.create PRUEBA_COMBATIENTE.merge(
        caso_id: caso.id
      )
      assert combatiente.valid?

      ac = Sivel2Gen::AntecedenteCombatiente.create(
        combatiente_id: combatiente.id,
        antecedente_id: antecedente.id,
      )
      assert_predicate ac, :valid?

      combatiente.destroy
      antecedente.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::AntecedenteCombatiente.create

      assert_not ap.valid?
    end
  end
end
