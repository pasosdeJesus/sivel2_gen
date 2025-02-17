# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class AntecedenteTest < ActiveSupport::TestCase
    test "valido" do
      antecedente = Antecedente.create(PRUEBA_ANTECEDENTE)

      assert antecedente.valid?
      antecedente.destroy
    end

    test "no valido" do
      antecedente = Antecedente.new(PRUEBA_ANTECEDENTE)
      antecedente.nombre = ""

      assert_not antecedente.valid?
      antecedente.destroy
    end

    test "existente" do
      antecedente = Antecedente.find_by(id: 1)

      assert_equal "AMENAZA", antecedente.nombre
    end
  end
end
