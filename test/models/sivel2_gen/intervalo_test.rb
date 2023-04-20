require_relative '../../test_helper'

module Sivel2Gen
  class AnuncioTest < ActiveSupport::TestCase

    test "valido" do
      anuncio = Anuncio.create PRUEBA_ANUNCIO
      assert anuncio.valid?
      anuncio.destroy
    end

    test "no valido" do
      anuncio = Anuncio.new PRUEBA_ANUNCIO
      anuncio.nombre = ''
      assert_not anuncio.valid?
      anuncio.destroy
    end

    test "existente" do
      anuncio = Sivel2Gen::Anuncio.where(id: 1).take
      assert_equal "MADRUGADA", anuncio.nombre
    end

  end
end
