require 'test_helper'

module Sivel2Gen
  class ContextovictimaVictimaTest < ActiveSupport::TestCase


    test "valido" do
      contextovictima = Contextovictima.create(PRUEBA_CONTEXTOVICTIMA)

      assert contextovictima.valid?

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      persona = Msip::Persona.create PRUEBA_PERSONA
      assert persona.valid?

      rango = Msip::EdadSexoHelper.buscar_rango_edad(
        Msip::EdadSexoHelper.edad_de_fechanac_fecha(
            persona.anionac, persona.mesnac, persona.dianac,
            caso.fecha.year, caso.fecha.month, caso.fecha.day
        ), 'Sivel2Gen::Rangoedad'
      )

      victima = Sivel2Gen::Victima.create PRUEBA_VICTIMA.merge(
        id_caso: caso.id,
        id_persona: persona.id,
        id_rangoedad: rango
      )
      assert victima.valid?

      cv = ContextovictimaVictima.create(
        victima_id: victima.id,
        contextovictima_id: contextovictima.id
      )
      assert cv.valid?

      victima.destroy
      persona.destroy
      caso.destroy
      contextovictima.destroy
    end

    test "no valido" do
      victima = Victima.new PRUEBA_VICTIMA.merge(
        id_caso: nil
      )
      assert_not victima.valid?
      victima.destroy
    end

  end
end
