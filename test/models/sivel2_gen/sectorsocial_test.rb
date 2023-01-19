# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class SectorsocialTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      sectorsocial = Sectorsocial.create(PRUEBA_SECTORSOCIAL)

      assert sectorsocial.valid?
      sectorsocial.destroy
    end

    test "no valido" do
      sectorsocial = Sectorsocial.create(PRUEBA_SECTORSOCIAL.merge(nombre: nil))

      assert_not sectorsocial.valid?
    end

    test "existente" do
      sectorsocial = Sectorsocial.where(id: 1).take
      assert_equal sectorsocial.nombre, "CAMPESINO"
    end

  end
end
