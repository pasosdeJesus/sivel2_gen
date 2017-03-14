# encoding: UTF-8
require_relative '../../test_helper'

module Sivel2Gen
  class EtniaTest < ActiveSupport::TestCase

    PRUEBA_ETNIA= {
      id: 1000 ,
      nombre: "Etnia",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }


    test "valido" do
      etnia = Etnia.create PRUEBA_ETNIA
      assert etnia.valid?
      etnia.destroy
    end

    test "no valido" do
      etnia = Etnia.new PRUEBA_ETNIA; etnia.nombre = ''
      assert_not etnia.valid?
      etnia.destroy
    end

    test "existente" do
      etnia = Sivel2Gen::Etnia.where(id: 1).take
      assert_equal etnia.nombre, "SIN INFORMACIÓN"
    end

  end
end
