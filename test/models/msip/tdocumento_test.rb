
require_relative '../../test_helper'

module Msip
  class TdocumentoTest < ActiveSupport::TestCase

    PRUEBA_TDOCUMENTO= {
      id: 1000,
      nombre: "Tdocumento",
      sigla: "TD",
      formatoregex: "[0-9]*",
      fechacreacion: "2014-09-22",
      created_at: "2014-09-22"
    }


    test "valido" do
      tdocumento = Tdocumento.create PRUEBA_TDOCUMENTO
      assert tdocumento.valid?
      tdocumento.destroy
    end

    test "no valido" do
      tdocumento = Tdocumento.new PRUEBA_TDOCUMENTO
      tdocumento.nombre = ''
      assert_not tdocumento.valid?
      tdocumento.destroy
    end

    test "existente" do
      tdocumento = Msip::Tdocumento.where(id: 7).take
      assert_equal tdocumento.nombre, "OTRO"
    end

  end

end
