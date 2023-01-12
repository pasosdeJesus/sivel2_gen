# frozen_string_literal: true

require "test_helper"

module Msip
  class FuenteprensaTest < ActiveSupport::TestCase
    test "valido" do
      fuenteprensa = Fuenteprensa.create(PRUEBA_FUENTEPRENSA)

      assert_predicate fuenteprensa, :valid?
      fuenteprensa.destroy
    end

    test "no valido" do
      fuenteprensa =
        Fuenteprensa.new(PRUEBA_FUENTEPRENSA)
      fuenteprensa.nombre = ""

      assert_not fuenteprensa.valid?
      fuenteprensa.destroy
    end

    test "existente" do
      fuenteprensa = Msip::Fuenteprensa.where(id: 1).take

      assert_equal("EL TIEMPO", fuenteprensa.nombre)
    end
  end
end
