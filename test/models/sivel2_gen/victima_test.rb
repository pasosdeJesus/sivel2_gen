# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class VictimaTest < ActiveSupport::TestCase
    test "valido" do
      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      persona = Msip::Persona.create(PRUEBA_PERSONA)

      assert persona.valid?

      rango = Msip::EdadSexoHelper.buscar_rango_edad(
        Msip::EdadSexoHelper.edad_de_fechanac_fecha(
          persona.anionac,
          persona.mesnac,
          persona.dianac,
          caso.fecha.year,
          caso.fecha.month,
          caso.fecha.day,
        ),
        "Sivel2Gen::Rangoedad",
      )

      victima = Sivel2Gen::Victima.create(PRUEBA_VICTIMA.merge(
        caso_id: caso.id,
        persona_id: persona.id,
        rangoedad_id: rango,
      ))

      assert victima.valid?

      victima.destroy
      persona.destroy
      caso.destroy
    end

    test "no valido" do
      victima = Victima.new(PRUEBA_VICTIMA.merge(
        caso_id: nil,
      ))

      assert_not victima.valid?
      victima.destroy
    end
  end
end
