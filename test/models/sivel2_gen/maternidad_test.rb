# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class MaternidadTest < ActiveSupport::TestCase
    PRUEBA_MATERNIDAD = {
      nombre: "Maternidad",
      fechacreacion: "2014-09-11",
      created_at: "2014-09-11",
    }

    test "valido" do
      maternidad = Maternidad.create(PRUEBA_MATERNIDAD)

      assert maternidad.valid?
      maternidad.destroy
    end

    test "no valido" do
      maternidad = Maternidad.new(PRUEBA_MATERNIDAD)
      maternidad.nombre = ""

      assert_not maternidad.valid?
      maternidad.destroy
    end

    test "existente" do
      maternidad = Maternidad.find_by(id: 0)

      assert_equal "NO APLICA", maternidad.nombre
    end
  end
end
