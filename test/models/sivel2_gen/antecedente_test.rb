require 'test_helper'

module Sivel2Gen
  class AntecedenteTest < ActiveSupport::TestCase


    test "valido" do
      antecedente = Antecedente.create PRUEBA_ANTECEDENTE
      assert antecedente.valid?
      antecedente.destroy
    end

    test "no valido" do
      antecedente = Antecedente.new PRUEBA_ANTECEDENTE
      antecedente.nombre = ''
      assert_not antecedente.valid?
      antecedente.destroy
    end

    test "existente" do
      antecedente = Antecedente.where(id: 1).take
      assert_equal antecedente.nombre, "AMENAZA"
    end

  end
end
