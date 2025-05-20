# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class ContextovictimaTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      contextovictima = Contextovictima.create(PRUEBA_CONTEXTOVICTIMA)

      assert contextovictima.valid?
      contextovictima.destroy
    end

    test "no valido" do
      contextovictima = Contextovictima.create(PRUEBA_CONTEXTOVICTIMA
                                               .merge(nombre: nil))

      assert_not contextovictima.valid?
    end
  end
end
