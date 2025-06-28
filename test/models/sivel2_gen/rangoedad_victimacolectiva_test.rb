# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class RangoedadVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      rangoedad = Rangoedad.new(PRUEBA_RANGOEDAD)

      if !rangoedad.valid?
        puts rangoedad.errors.messages
      end
      assert_predicate rangoedad, :valid?
      rangoedad.save

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)

      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create(PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: caso.id,
        grupoper_id: grupoper.id,
      ))

      assert victimacolectiva.valid?

      av = Sivel2Gen::RangoedadVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        rangoedad_id: rangoedad.id,
      )

      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      rangoedad.destroy
    end

    test "no valido" do
      ap = RangoedadVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
