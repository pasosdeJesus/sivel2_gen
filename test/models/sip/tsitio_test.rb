# encoding: UTF-8

require_relative '../../test_helper'

module Sip
  class TsitioTest < ActiveSupport::TestCase

    PRUEBA_TSITIO= {
      id: 1000,
      nombre: "Tsitio",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09",
    }

    test "valido" do
      tsitio = Tsitio.create PRUEBA_TSITIO
      assert tsitio.valid?
      tsitio.destroy
    end

    test "no valido" do
      tsitio = Tsitio.new PRUEBA_TSITIO
      tsitio.nombre = ''
      assert_not tsitio.valid?
      tsitio.destroy
    end

    test "existente" do
      tsitio = Sip::Tsitio.where(id: 2).take
      assert_equal tsitio.nombre, "URBANO"
    end

  end
end
