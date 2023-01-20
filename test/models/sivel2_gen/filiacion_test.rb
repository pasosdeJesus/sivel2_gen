require_relative '../../test_helper'

module Sivel2Gen
  class FiliacionTest < ActiveSupport::TestCase

    test "valido" do
      filiacion = Filiacion.create PRUEBA_FILIACION
      assert filiacion.valid?
      filiacion.destroy
    end

    test "no valido" do
      filiacion = Filiacion.new PRUEBA_FILIACION
      filiacion.nombre = ''
      assert_not filiacion.valid?
      filiacion.destroy
    end

    test "existente" do
      filiacion = Sivel2Gen::Filiacion.where(id: 1).take
      assert_equal filiacion.nombre, "LIBERAL"
    end

  end
end
