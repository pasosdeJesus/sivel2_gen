# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class ProfesionTest < ActiveSupport::TestCase
    test "valido" do
      profesion = Profesion.create(PRUEBA_PROFESION)

      assert profesion.valid?
      profesion.destroy
    end

    test "no valido" do
      profesion = Profesion.new(PRUEBA_PROFESION)
      profesion.nombre = ""

      assert_not profesion.valid?
      profesion.destroy
    end

    test "existente" do
      profesion = Sivel2Gen::Profesion.find_by(id: 22)

      assert_equal "SIN INFORMACIÓN", profesion.nombre
    end
  end
end
