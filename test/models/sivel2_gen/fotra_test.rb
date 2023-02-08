# frozen_string_literal: true

require "test_helper"

module Sivel2Gen
  class FotraTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      fotra = Fotra.create(PRUEBA_FOTRA)

      assert fotra.valid?

      fotra.destroy
    end

    test "no valido" do
      fotra = Fotra.create

      assert_not fotra.valid?
    end
  end
end
