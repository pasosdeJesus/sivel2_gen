# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class OrganizacionTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      organizacion = Organizacion.create(PRUEBA_ORGANIZACION)

      assert organizacion.valid?
      organizacion.destroy
    end

    test "no valido" do
      organizacion = Organizacion.create(PRUEBA_ORGANIZACION.merge(nombre: nil))

      assert_not organizacion.valid?
    end
  end
end
