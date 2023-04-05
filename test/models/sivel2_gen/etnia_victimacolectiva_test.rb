# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class EtniaVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      etnia = Etnia.new(PRUEBA_ETNIA)
      assert_predicate etnia, :valid?
      etnia.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      grupoper = Msip::Grupoper.create PRUEBA_GRUPOPER
      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: caso.id,
        grupoper_id: grupoper.id,
      )
      assert victimacolectiva.valid?

      av = EtniaVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        etnia_id: etnia.id,
      )
      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      etnia.destroy
    end

    test "no valido" do
      ap = EtniaVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
