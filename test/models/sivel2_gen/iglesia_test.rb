# encoding: UTF-8
require_relative '../../test_helper'

module Sivel2Gen
  class IglesiaTest < ActiveSupport::TestCase

    PRUEBA_IGLESIA= {
      id: 1000,
      nombre: "Iglesia",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

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
