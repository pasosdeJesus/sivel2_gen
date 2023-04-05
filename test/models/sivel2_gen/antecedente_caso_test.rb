# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class AntecedenteCasoTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      antecedente = Antecedente.new(PRUEBA_ANTECEDENTE)
      assert_predicate antecedente, :valid?
      antecedente.save

      caso = Caso.create(PRUEBA_CASO)
      assert_predicate caso, :valid?

      ac = Sivel2Gen::AntecedenteCaso.create(
        caso_id: caso.id,
        antecedente_id: antecedente.id,
      )
      assert_predicate ac, :valid?

      caso.destroy
      antecedente.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::AntecedenteCaso.create

      assert_not ap.valid?
    end
  end
end
