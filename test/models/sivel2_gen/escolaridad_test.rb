require_relative '../../test_helper'

module Sivel2Gen
  class EscolaridadTest < ActiveSupport::TestCase

    PRUEBA_ESCOLARIDAD= {
      id: 1000,
      nombre: "Escolaridad",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      escolaridad = Escolaridad.create PRUEBA_ESCOLARIDAD
      assert escolaridad.valid?
      escolaridad.destroy
    end

    test "no valido" do
      escolaridad = Escolaridad.new PRUEBA_ESCOLARIDAD
      escolaridad.nombre = ''
      assert_not escolaridad.valid?
      escolaridad.destroy
    end

    test "existente" do
    	escolaridad = Sivel2Gen::Escolaridad.where(id: 0).take
      assert_equal escolaridad.nombre, "SIN INFORMACIÓN"
    end

  end
end
