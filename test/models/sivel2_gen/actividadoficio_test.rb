# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class ActividadoficioTest < ActiveSupport::TestCase
    test "valido" do
      actividadoficio = Actividadoficio.create(PRUEBA_ACTIVIDADOFICIO)

      assert actividadoficio.valid?
      actividadoficio.destroy
    end

    test "no valido" do
      actividadoficio = Actividadoficio.new(PRUEBA_ACTIVIDADOFICIO)
      actividadoficio.nombre = ""

      assert_not actividadoficio.valid?
      actividadoficio.destroy
    end

    test "existente" do
      actividadoficio = Actividadoficio.find_by(id: 0)

      assert_equal "SIN INFORMACIÓN", actividadoficio.nombre
    end
  end
end
