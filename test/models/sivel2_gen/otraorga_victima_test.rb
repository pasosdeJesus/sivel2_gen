# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class OtraorgaVictimaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      organizacion = Organizacion.new(PRUEBA_ORGANIZACION)

      assert_predicate organizacion, :valid?
      organizacion.save

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      persona = Msip::Persona.create(PRUEBA_PERSONA)

      assert persona.valid?

      victima = Victima.create(PRUEBA_VICTIMA.merge(
        caso_id: caso.id,
        persona_id: persona.id,
      ))

      assert victima.valid?

      av = OtraorgaVictima.create(
        victima_id: victima.id,
        organizacion_id: organizacion.id,
      )

      assert_predicate av, :valid?

      victima.destroy
      persona.destroy
      caso.destroy
      organizacion.destroy
    end

    test "no valido" do
      ap = OtraorgaVictima.create

      assert_not ap.valid?
    end
  end
end
