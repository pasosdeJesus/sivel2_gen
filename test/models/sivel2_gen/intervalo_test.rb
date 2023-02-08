require_relative '../../test_helper'

module Sivel2Gen
  class IntervaloTest < ActiveSupport::TestCase

    test "valido" do
      intervalo = Intervalo.create PRUEBA_INTERVALO
      assert intervalo.valid?
      intervalo.destroy
    end

    test "no valido" do
      intervalo = Intervalo.new PRUEBA_INTERVALO
      intervalo.nombre = ''
      assert_not intervalo.valid?
      intervalo.destroy
    end

    test "existente" do
      intervalo = Sivel2Gen::Intervalo.where(id: 1).take
      assert_equal "MADRUGADA", intervalo.nombre
    end

  end
end
