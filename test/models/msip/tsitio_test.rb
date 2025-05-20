# frozen_string_literal: true

require_relative "../../test_helper"

module Msip
  class TsitioTest < ActiveSupport::TestCase
    PRUEBA_TSITIO = {
      id: 1000,
      nombre: "Tsitio",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09",
    }

    test "valido" do
      tsitio = Tsitio.create(PRUEBA_TSITIO)

      assert tsitio.valid?
      tsitio.destroy
    end

    test "no valido" do
      tsitio = Tsitio.new(PRUEBA_TSITIO)
      tsitio.nombre = ""

      assert_not tsitio.valid?
      tsitio.destroy
    end

    test "existente" do
      tsitio = Msip::Tsitio.find_by(id: 2)

      assert_equal "URBANO", tsitio.nombre
    end
  end
end
