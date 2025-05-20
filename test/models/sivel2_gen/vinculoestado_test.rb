# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class VinculoestadoTest < ActiveSupport::TestCase
    test "valido" do
      vinculoestado = Vinculoestado.create(PRUEBA_VINCULOESTADO)

      assert vinculoestado.valid?
      vinculoestado.destroy
    end

    test "no valido" do
      vinculoestado = Vinculoestado.new(PRUEBA_VINCULOESTADO)
      vinculoestado.nombre = ""

      assert_not vinculoestado.valid?
      vinculoestado.destroy
    end

    test "existente" do
      vinculoestado = Vinculoestado.find_by(id: 1)

      assert_equal "CONGRESO", vinculoestado.nombre
    end
  end
end
