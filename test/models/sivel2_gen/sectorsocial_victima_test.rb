# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class AntecedenteVictimaAntecedenteTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      antecedente = Antecedente.new(PRUEBA_ANTECEDENTE)
      assert_predicate antecedente, :valid?
      antecedente.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      persona = Msip::Persona.create PRUEBA_PERSONA
      assert persona.valid?

      victima = Victima.create PRUEBA_VICTIMA.merge(
        id_caso: caso.id,
        id_persona: persona.id,
      )
      assert victima.valid?

      av = Sivel2Gen::AntecedenteVictima.create(
        id_victima: victima.id,
        id_antecedente: antecedente.id,
      )
      assert_predicate av, :valid?

      victima.destroy
      persona.destroy
      caso.destroy
      antecedente.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::AntecedenteVictima.create

      assert_not ap.valid?
    end
  end
end
