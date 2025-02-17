# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class ResagresionTest < ActiveSupport::TestCase
    test "valido" do
      resagresion = Resagresion.create(PRUEBA_RESAGRESION)

      assert resagresion.valid?
      resagresion.destroy
    end

    test "no valido" do
      resagresion = Resagresion.new(PRUEBA_RESAGRESION)
      resagresion.nombre = ""

      assert_not resagresion.valid?
      resagresion.destroy
    end

    test "existente" do
      resagresion = Sivel2Gen::Resagresion.find_by(id: 1)

      assert_equal "MUERTO", resagresion.nombre
    end
  end
end
