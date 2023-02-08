# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class SectorsocialVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      sectorsocial = Sectorsocial.new(PRUEBA_SECTORSOCIAL)
      assert_predicate sectorsocial, :valid?
      sectorsocial.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      grupoper = Msip::Grupoper.create PRUEBA_GRUPOPER
      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create PRUEBA_VICTIMACOLECTIVA.merge(
        id_caso: caso.id,
        id_grupoper: grupoper.id,
      )
      assert victimacolectiva.valid?

      av = Sivel2Gen::SectorsocialVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        id_sectorsocial: sectorsocial.id,
      )
      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      sectorsocial.destroy
    end

    test "no valido" do
      ap = SectorsocialVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
