# encoding: UTF-8
require_relative '../../test_helper'

module Sivel2Gen
  class ProfesionTest < ActiveSupport::TestCase

    PRUEBA_PROFESION= {
      nombre: "Profesion",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      profesion = Profesion.create PRUEBA_PROFESION
      assert profesion.valid?
      profesion.destroy
    end

    test "no valido" do
      profesion = Profesion.new PRUEBA_PROFESION
      profesion.nombre = ''
      assert_not profesion.valid?
      profesion.destroy
    end

    test "existente" do
      profesion = Sivel2Gen::Profesion.where(id: 22).take
      assert_equal profesion.nombre, "SIN INFORMACIÓN"
    end

  end
end
