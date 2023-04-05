# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class ProfesionVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      profesion = Profesion.new(PRUEBA_PROFESION)
      assert_predicate profesion, :valid?
      profesion.save

      caso = Caso.create PRUEBA_CASO
      assert caso.valid?

      grupoper = Msip::Grupoper.create PRUEBA_GRUPOPER
      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: caso.id,
        grupoper_id: grupoper.id,
      )
      assert victimacolectiva.valid?

      av = Sivel2Gen::ProfesionVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        profesion_id: profesion.id,
      )
      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      profesion.destroy
    end

    test "no valido" do
      ap = ProfesionVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
