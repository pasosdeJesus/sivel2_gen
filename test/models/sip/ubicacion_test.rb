# encoding: UTF-8

require_relative '../../test_helper'

module Sip

  class UbicacionTest < ActiveSupport::TestCase

    PRUEBA_CASO = {
      fecha: "2014-11-05",
      memo: "",
      created_at: "2014-11-05"
    }

    PRUEBA_UBICACION= {
      id_tsitio: 1,
      id_pais: 862,
      created_at: "2014-11-06"
    }


    test "simple" do
      caso = Sivel2Gen::Caso.create PRUEBA_CASO
      pais = Pais.find(862) 
      ubicacion = Ubicacion.new PRUEBA_UBICACION
      ubicacion.pais = pais
      ubicacion.caso = caso

      assert ubicacion.valid?
      ubicacion.destroy
      caso.destroy
    end

    test "no valido 1" do
      ubicacion = Ubicacion.create PRUEBA_UBICACION
      assert_not ubicacion.valid?
      ubicacion.destroy
    end

    test "no valido 2" do
      caso = Sivel2Gen::Caso.create PRUEBA_CASO
      ubicacion = Ubicacion.new PRUEBA_UBICACION
      ubicacion.id_caso = caso.id
      ubicacion.id_tsitio = nil 
      assert_not ubicacion.valid?
      ubicacion.destroy
      caso.destroy
    end

  end
end
