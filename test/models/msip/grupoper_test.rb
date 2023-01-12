# frozen_string_literal: true

require "test_helper"

module Msip
  class GrupoperTest < ActiveSupport::TestCase
    test "valido" do
      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)

      assert_predicate grupoper, :valid?
      grupoper.destroy
    end

    test "no valido por falta de nombre" do
      grupoper = Msip::Grupoper.new(PRUEBA_GRUPOPER)
      grupoper.nombre = nil

      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "no valido por falta de nombre 2" do
      grupoper = Msip::Grupoper.new(PRUEBA_GRUPOPER)
      grupoper.nombre = ""

      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "no valido por nombre largo" do
      grupoper = Msip::Grupoper.new(PRUEBA_GRUPOPER)
      grupoper.nombre = "x" * 600

      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "no valido por anotacion larga" do
      grupoper = Msip::Grupoper.new(PRUEBA_GRUPOPER)
      grupoper.anotaciones = "x" * 2000

      assert_not grupoper.valid?
      grupoper.destroy
    end

    test "valido sin anotación" do
      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)
      grupoper.anotaciones = nil

      assert_predicate grupoper, :valid?
      grupoper.destroy
    end
  end
end
