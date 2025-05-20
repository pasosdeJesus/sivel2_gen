# frozen_string_literal: true

require_relative "../../test_helper"

module Sivel2Gen
  class PresponsableTest < ActiveSupport::TestCase
    test "valido" do
      presponsable = Presponsable.create(PRUEBA_PRESPONSABLE)
      # byebug
      assert presponsable.valid?
      presponsable.destroy
    end

    test "no valido" do
      presponsable = Presponsable.new(PRUEBA_PRESPONSABLE)
      presponsable.nombre = ""

      assert_not presponsable.valid?
      presponsable.destroy
    end

    test "existente" do
      presponsable = Sivel2Gen::Presponsable.find_by(id: 35)

      assert_equal "SIN INFORMACIÓN", presponsable.nombre.upcase
    end
  end
end
