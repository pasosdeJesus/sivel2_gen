require_relative '../../test_helper'

module Sivel2Gen
  class RegionTest < ActiveSupport::TestCase

    PRUEBA_REGION= {
      nombre: "Region",
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      region = Region.create PRUEBA_REGION
      assert region.valid?
      region.destroy
    end

    test "no valido" do
      region = Region.new PRUEBA_REGION; region.nombre = ''
      assert_not region.valid?
      region.destroy
    end

    test "existente" do
      region = Sivel2Gen::Region.where(id: 5).take
      assert_equal region.nombre, "COSTA ATLANTICA"
    end

  end
end
