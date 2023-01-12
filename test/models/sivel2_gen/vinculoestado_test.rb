require 'test_helper'

module Sivel2Gen
  class VinculoestadoTest < ActiveSupport::TestCase

    test "valido" do
      vinculoestado = Vinculoestado.create PRUEBA_VINCULOESTADO
      assert vinculoestado.valid?
      vinculoestado.destroy
    end

    test "no valido" do
      vinculoestado = Vinculoestado.new PRUEBA_VINCULOESTADO
      vinculoestado.nombre = ''
      assert_not vinculoestado.valid?
      vinculoestado.destroy
    end

    test "existente" do
      vinculoestado = Vinculoestado.where(id: 1).take
      assert_equal vinculoestado.nombre, "CONGRESO"
    end

  end
end
