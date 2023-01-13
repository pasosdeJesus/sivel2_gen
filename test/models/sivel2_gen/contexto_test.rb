# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class ContextoTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      contexto = Contexto.create(PRUEBA_CONTEXTO)

      assert contexto.valid?
      contexto.destroy
    end

    test "no valido" do
      contexto = Contexto.create(PRUEBA_CONTEXTO.merge(nombre: nil))

      assert_not contexto.valid?
    end
  end
end
