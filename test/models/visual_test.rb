# frozen_string_literal: true

require 'test_helper'

class VisualTest < ActiveSupport::TestCase

  PRUEBA_VISUAL = {
    nombre: "Visual",
    fechacreacion: "2019-06-18",
    created_at: "2019-06-18"
  }.freeze

  test "valido" do
    Visual = ::Visual.create(
      PRUEBA_VISUAL)
    assert(Visual.valid?)
    Visual.destroy
  end

  test "no valido" do
    Visual = ::Visual.new(
      PRUEBA_VISUAL)
    Visual.nombre = ''
    assert_not(Visual.valid?)
    Visual.destroy
  end

  test "existente" do
    skip
    Visual = ::Visual.where(id: 0).take
    assert_equal(Visual.nombre, "SIN INFORMACIÓN")
  end

end
