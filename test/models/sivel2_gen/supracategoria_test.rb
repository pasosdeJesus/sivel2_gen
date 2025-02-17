# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class SupracategoriaTest < ActiveSupport::TestCase
    PRUEBA_SUPRACATEGORIA = {
      id: 1000,
      tviolencia_id: "A",
      nombre: "Supracategoria",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09",
    }

    test "valido" do
      supracategoria = Supracategoria.create(PRUEBA_SUPRACATEGORIA)

      assert supracategoria.valid?
      supracategoria.destroy
    end

    test "no valido" do
      supracategoria = Supracategoria.new(PRUEBA_SUPRACATEGORIA)
      supracategoria.nombre = ""

      assert_not supracategoria.valid?
      supracategoria.destroy
    end

    test "existente" do
      supracategoria = Sivel2Gen::Supracategoria.find_by(id: 1)

      assert_equal "PERSECUCIÓN POLÍTICA", supracategoria.nombre
    end
  end
end
