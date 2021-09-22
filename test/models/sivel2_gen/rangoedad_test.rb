require_relative '../../test_helper'

module Sivel2Gen
  class RangoedadTest < ActiveSupport::TestCase

    PRUEBA_RANGOEDAD= {
      id: 1000,
      nombre: "1-2",
      limiteinferior: 1,
      limitesuperior: 2,
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

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
