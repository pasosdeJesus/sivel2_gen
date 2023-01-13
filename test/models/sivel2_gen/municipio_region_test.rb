# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class MunicipioRegionTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      region = Region.create(PRUEBA_REGION)

      assert region.valid?

      municipio = Msip::Municipio.create(PRUEBA_MUNICIPIO)

      assert municipio.valid?

      cc = Sivel2Gen::MunicipioRegion.create(
        municipio_id: municipio.id,
        region_id: region.id,
      )

      assert cc.valid?

      municipio.destroy
      region.destroy
    end

    test "no valido" do
      mr = Sivel2Gen::MunicipioRegion.create

      assert_not mr.valid?
    end
  end
end
