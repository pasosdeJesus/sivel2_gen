
require_relative '../../test_helper'

module Msip
  class EtiquetaTest < ActiveSupport::TestCase

    PRUEBA_ETIQUETA= {
      nombre:"n",
      fechacreacion:"2014-08-05",
      observaciones: '',
      fechadeshabilitacion: nil
    }

    test "valido" do
      etiqueta = Etiqueta.create PRUEBA_ETIQUETA
      assert etiqueta.valid?
      etiqueta.destroy
    end

    test "no valido" do
      etiqueta = Etiqueta.new PRUEBA_ETIQUETA
      etiqueta.nombre = ''
      assert_not etiqueta.valid?
      etiqueta.destroy
    end

    test "existente" do
      etiqueta = Msip::Etiqueta.find(3)
      assert_equal etiqueta.nombre, "IMPORTA_RELATO"
    end
  end
end
