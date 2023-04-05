# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class AntecedenteVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      antecedente = Antecedente.new(PRUEBA_ANTECEDENTE)
      assert_predicate antecedente, :valid?
      antecedente.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      grupoper = Msip::Grupoper.create PRUEBA_GRUPOPER
      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: caso.id,
        grupoper_id: grupoper.id,
      )
      assert victimacolectiva.valid?

      av = Sivel2Gen::AntecedenteVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        antecedente_id: antecedente.id,
      )
      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      antecedente.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::AntecedenteVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
