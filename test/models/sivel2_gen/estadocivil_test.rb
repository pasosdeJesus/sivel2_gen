# encoding: UTF-8
require_relative '../../test_helper'

module Sivel2Gen
  class EstadocivilTest < ActiveSupport::TestCase

    PRUEBA_ESTADOCIVIL= {
      id: 1000 ,
      nombre: "Estadocivil",
      fechacreacion: "2014-09-11",
      created_at: "2014-09-11",
    }


    test "valido" do
      estadocivil = Estadocivil.create PRUEBA_ESTADOCIVIL
      assert estadocivil.valid?
      estadocivil.destroy
    end

    test "no valido" do
      estadocivil = Estadocivil.new PRUEBA_ESTADOCIVIL
      estadocivil.nombre = ''
      assert_not estadocivil.valid?
      estadocivil.destroy
    end

    test "existente" do
      estadocivil = Estadocivil.where(id: 0).take
      assert_equal estadocivil.nombre, "SIN INFORMACIÓN"
    end

  end
end
