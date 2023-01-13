# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoRegionTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      region = Region.create(PRUEBA_REGION)

      assert region.valid?

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      cc = Sivel2Gen::CasoRegion.create(
        id_caso: caso.id,
        id_region: region.id,
      )

      assert cc.valid?

      caso.destroy
      region.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::CasoRegion.create

      assert_not ap.valid?
    end
  end
end
