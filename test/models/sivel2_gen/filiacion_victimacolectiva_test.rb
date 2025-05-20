# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class FiliacionVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      filiacion = Filiacion.new(PRUEBA_FILIACION)

      assert_predicate filiacion, :valid?
      filiacion.save

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)

      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create(PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: caso.id,
        grupoper_id: grupoper.id,
      ))

      assert victimacolectiva.valid?

      av = FiliacionVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        filiacion_id: filiacion.id,
      )

      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      filiacion.destroy
    end

    test "no valido" do
      ap = FiliacionVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
