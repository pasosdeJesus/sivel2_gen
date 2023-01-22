require_relative '../../test_helper'

module Sivel2Gen
  class IglesiaTest < ActiveSupport::TestCase

    test "valido" do
      iglesia = Iglesia.create PRUEBA_IGLESIA
      assert iglesia.valid?
      iglesia.destroy
    end

    test "no valido" do
      iglesia = Iglesia.new PRUEBA_IGLESIA
      iglesia.nombre = ''
      assert_not iglesia.valid?
      iglesia.destroy
    end

    test "existente" do
      iglesia = Sivel2Gen::Iglesia.where(id: 1).take
      assert_equal iglesia.nombre, "SIN INFORMACIÓN"
    end

  end
end
