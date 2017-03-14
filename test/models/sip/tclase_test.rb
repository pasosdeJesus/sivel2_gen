# encoding: UTF-8
require_relative '../../test_helper'

module Sip
  class TclaseTest < ActiveSupport::TestCase

    PRUEBA_TCLASE= {
      nombre:"n",
		  id: 'x',
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      tclase = Tclase.create PRUEBA_TCLASE
      assert tclase.valid?
      tclase.destroy
    end

    test "no valido" do
      tclase = Tclase.new PRUEBA_TCLASE
      tclase.nombre = ''
      assert_not tclase.valid?
      tclase.destroy
    end

    test "existente" do
      tclase = Sip::Tclase.where(id: 'C').take
      assert_equal tclase.nombre, "CORREGIMIENTO"
    end

  end
end
