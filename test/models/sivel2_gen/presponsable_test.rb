require_relative '../../test_helper'

module Sivel2Gen
  class PresponsableTest < ActiveSupport::TestCase

    PRUEBA_PRESPONSABLE= {
      id: 1000 ,
      nombre: "Presponsable",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      presponsable = Presponsable.create PRUEBA_PRESPONSABLE
      #byebug
      assert presponsable.valid?
      presponsable.destroy
    end

    test "no valido" do
      presponsable = Presponsable.new PRUEBA_PRESPONSABLE
      presponsable.nombre = ''
      assert_not presponsable.valid?
      presponsable.destroy
    end

    test "existente" do
      presponsable = Sivel2Gen::Presponsable.where(id: 35).take
      assert_equal presponsable.nombre.upcase, "SIN INFORMACIÓN"
    end

  end
end
