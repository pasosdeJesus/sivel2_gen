# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class CasoEtiquetaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      etiqueta = Msip::Etiqueta.create(PRUEBA_ETIQUETA)
      assert etiqueta.valid?

      caso = Caso.create(PRUEBA_CASO)
      assert caso.valid?

      usuario = ::Usuario.create(PRUEBA_USUARIO)
      assert usuario.valid?
      cs = Sivel2Gen::CasoEtiqueta.create(
        id_caso: caso.id,
        id_etiqueta: etiqueta.id,
        id_usuario: usuario.id,
        fecha: '2023-01-11',
      )
      assert_predicate cs, :valid?

      caso.destroy
      etiqueta.destroy
    end

    test "no valido" do
      cs = Sivel2Gen::CasoEtiqueta.create

      assert_not cs.valid?
    end
  end
end
