# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class EscolaridadTest < ActiveSupport::TestCase
    test "valido" do
      escolaridad = Escolaridad.create(PRUEBA_ESCOLARIDAD)

      assert escolaridad.valid?
      escolaridad.destroy
    end

    test "no valido" do
      escolaridad = Escolaridad.new(PRUEBA_ESCOLARIDAD)
      escolaridad.nombre = ""

      assert_not escolaridad.valid?
      escolaridad.destroy
    end
  end
end
