require 'test_helper'

module Sivel2Gen
  class CasoTest < ActiveSupport::TestCase


    test "valido" do
      caso = Caso.create PRUEBA_CASO
      assert caso.valid?
      caso.destroy
    end

    test "no valido" do
      caso = Caso.new PRUEBA_CASO
      caso.fecha = nil
      assert_not caso.valid?
      caso.destroy
    end

  end
end
