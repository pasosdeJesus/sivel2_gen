# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class AnexoCasoAnexoTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      anexo = Msip::Anexo.new(PRUEBA_ANEXO)
      anexo.adjunto = File.new(Rails.root + "db/seeds.rb")

      assert_predicate anexo, :valid?
      anexo.save

      caso = Caso.create(PRUEBA_CASO)

      assert_predicate caso, :valid?

      ac = Sivel2Gen::AnexoCaso.create(
        caso_id: caso.id,
        anexo_id: anexo.id,
        fecha: "2023-01-10",
      )

      assert_predicate ac, :valid?

      ac.destroy
      caso.destroy
      anexo.destroy
    end

    test "no valido" do
      ap = Sivel2Gen::AnexoCaso.create

      assert_not ap.valid?
    end
  end
end
