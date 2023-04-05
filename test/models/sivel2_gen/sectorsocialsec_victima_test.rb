# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class SectorsocialsecVictimaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      sectorsocial = Sectorsocial.new(PRUEBA_SECTORSOCIAL)
      assert_predicate sectorsocial, :valid?
      sectorsocial.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      persona = Msip::Persona.create PRUEBA_PERSONA
      assert persona.valid?

      victima = Victima.create PRUEBA_VICTIMA.merge(
        caso_id: caso.id,
        persona_id: persona.id,
      )
      assert victima.valid?

      av = SectorsocialsecVictima.create(
        victima_id: victima.id,
        sectorsocial_id: sectorsocial.id,
      )
      assert_predicate av, :valid?

      victima.destroy
      persona.destroy
      caso.destroy
      sectorsocial.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::Victima.create

      assert_not ap.valid?
    end
  end
end
