# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class RegionTest < ActiveSupport::TestCase
    test "valido" do
      region = Region.create(PRUEBA_REGION)

      assert region.valid?
      region.destroy
    end

    test "no valido" do
      region = Region.new(PRUEBA_REGION)
      region.nombre = ""

      assert_not region.valid?
      region.destroy
    end

    test "existente" do
      region = Sivel2Gen::Region.find_by(id: 5)

      assert_equal "COSTA ATLANTICA", region.nombre
    end
  end
end
