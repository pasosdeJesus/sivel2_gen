require_relative '../../test_helper'

module Sivel2Gen
  class RangoedadTest < ActiveSupport::TestCase

    test "valido" do
      rangoedad = Rangoedad.create PRUEBA_RANGOEDAD
      assert rangoedad.valid?
      rangoedad.destroy
    end

    test "no valido" do
      rangoedad = Rangoedad.new PRUEBA_RANGOEDAD
      rangoedad.nombre = ''
      assert_not rangoedad.valid?
      rangoedad.destroy
    end

    test "existente" do
      rangoedad = Sivel2Gen::Rangoedad.where(id: 1).take
      assert_equal rangoedad.nombre, "De 0 a 15 Años"
    end

  end
end
