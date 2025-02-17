# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoUsuarioTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      usuario = Msip::Usuario.create(PRUEBA_USUARIO)

      assert usuario.valid?

      caso = Caso.create(PRUEBA_CASO)

      assert caso.valid?

      cs = Sivel2Gen::CasoUsuario.create(
        caso_id: caso.id,
        usuario_id: usuario.id,
        fechainicio: "2023-01-11",
      )

      assert_predicate cs, :valid?

      caso.destroy
      usuario.destroy
    end

    test "no valido" do
      cs = Sivel2Gen::CasoUsuario.create

      assert_not cs.valid?
    end
  end
end
