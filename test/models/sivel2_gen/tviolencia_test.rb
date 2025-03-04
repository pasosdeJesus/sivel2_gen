# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class TviolenciaTest < ActiveSupport::TestCase
    PRUEBA_TVIOLENCIA = {
      id: "x",
      nombre: "TX",
      nomcorto: "TX",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09",
    }

    test "valido" do
      tviolencia = Tviolencia.create(PRUEBA_TVIOLENCIA)

      assert tviolencia.valid?
      tviolencia.destroy
    end

    test "no valido" do
      tviolencia = Tviolencia.new(PRUEBA_TVIOLENCIA)
      tviolencia.nombre = ""

      assert_not tviolencia.valid?
      tviolencia.destroy
    end

    test "existente" do
      tviolencia = Sivel2Gen::Tviolencia.find_by(id: "A")

      assert_equal "VIOLACIONES A LOS DERECHOS HUMANOS", tviolencia.nombre
    end
  end
end
