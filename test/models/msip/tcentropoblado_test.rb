require_relative '../../test_helper'

module Msip
  class TcentropobladoTest < ActiveSupport::TestCase

    PRUEBA_TCENTROPOBLADO= {
      nombre:"n",
		  id: 'x',
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      tcentropoblado = Tcentropoblado.create PRUEBA_TCENTROPOBLADO
      assert tcentropoblado.valid?
      tcentropoblado.destroy
    end

    test "no valido" do
      tcentropoblado = Tcentropoblado.new PRUEBA_TCENTROPOBLADO
      tcentropoblado.nombre = ''
      assert_not tcentropoblado.valid?
      tcentropoblado.destroy
    end

    test "existente" do
      tcentropoblado = Msip::Tcentropoblado.where(id: 'C').take
      assert_equal tcentropoblado.nombre, "CORREGIMIENTO"
    end

  end
end
