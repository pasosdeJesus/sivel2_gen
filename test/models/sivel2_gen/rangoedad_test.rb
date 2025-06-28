# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class RangoedadTest < ActiveSupport::TestCase
    test "valido" do
      rangoedad = Rangoedad.create(PRUEBA_RANGOEDAD)
      if !rangoedad.valid?
        puts rangoedad.errors.messages
      end
      assert rangoedad.valid?
      rangoedad.destroy
    end

    test "no valido" do
      rangoedad = Rangoedad.new(PRUEBA_RANGOEDAD)
      rangoedad.nombre = ""

      assert_not rangoedad.valid?
      rangoedad.destroy
    end

    test "existente" do
      rangoedad = Sivel2Gen::Rangoedad.find_by(id: 1)

      assert_equal "De 0 a 15 Años", rangoedad.nombre
    end
  end
end
