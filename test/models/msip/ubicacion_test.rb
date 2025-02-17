# frozen_string_literal: true

require_relative "../../test_helper"

module Msip
  class UbicacionTest < ActiveSupport::TestCase
    PRUEBA_CASO = {
      fecha: "2014-11-05",
      memo: "x",
      created_at: "2014-11-05",
    }

    PRUEBA_UBICACION = {
      tsitio_id: 1,
      pais_id: 862,
      created_at: "2014-11-06",
    }

    test "simple" do
      caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      pais = Pais.find(862)
      ubicacion = Ubicacion.new(PRUEBA_UBICACION)
      ubicacion.pais = pais
      ubicacion.caso = caso

      assert ubicacion.valid?
      ubicacion.destroy
      caso.destroy
    end

    test "no valido 1" do
      ubicacion = Ubicacion.create(PRUEBA_UBICACION)

      assert_not ubicacion.valid?
      ubicacion.destroy
    end

    test "no valido 2" do
      caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      ubicacion = Ubicacion.new(PRUEBA_UBICACION)
      ubicacion.caso_id = caso.id
      ubicacion.tsitio_id = nil

      assert_not ubicacion.valid?
      ubicacion.destroy
      caso.destroy
    end
  end
end
