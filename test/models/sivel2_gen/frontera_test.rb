# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class FronteraTest < ActiveSupport::TestCase
    test "valido" do
      frontera = Frontera.create(PRUEBA_FRONTERA)

      assert frontera.valid?
      frontera.destroy
    end

    test "no valido" do
      frontera = Frontera.new(PRUEBA_FRONTERA)
      frontera.nombre = ""

      assert_not frontera.valid?
      frontera.destroy
    end

    test "existente" do
      frontera = Sivel2Gen::Frontera.find_by(id: 1)

      assert_equal "Ecuador", frontera.nombre
    end
  end
end
