# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class OrganizacionVictimacolectivaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      organizacion = Organizacion.new(PRUEBA_ORGANIZACION)

      assert_predicate organizacion, :valid?
      organizacion.save

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER)

      assert grupoper.valid?

      victimacolectiva = Victimacolectiva.create(PRUEBA_VICTIMACOLECTIVA.merge(
        caso_id: caso.id,
        grupoper_id: grupoper.id,
      ))

      assert victimacolectiva.valid?

      av = Sivel2Gen::OrganizacionVictimacolectiva.create(
        victimacolectiva_id: victimacolectiva.id,
        organizacion_id: organizacion.id,
      )

      assert_predicate av, :valid?

      victimacolectiva.destroy
      grupoper.destroy
      caso.destroy
      organizacion.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::OrganizacionVictimacolectiva.create

      assert_not ap.valid?
    end
  end
end
