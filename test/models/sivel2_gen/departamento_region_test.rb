# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class DepartamentoRegionTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      region = Region.create(PRUEBA_REGION)

      assert region.valid?

      departamento = Msip::Departamento.create(PRUEBA_DEPARTAMENTO)

      assert departamento.valid?

      cc = Sivel2Gen::DepartamentoRegion.create(
        departamento_id: departamento.id,
        region_id: region.id,
      )

      assert cc.valid?

      departamento.destroy
      region.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::DepartamentoRegion.create

      assert_not ap.valid?
    end
  end
end
