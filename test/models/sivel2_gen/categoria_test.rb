require_relative '../../test_helper'

module Sivel2Gen
  class CategoriaTest < ActiveSupport::TestCase

    test "valido" do
      categoria = Categoria.create PRUEBA_CATEGORIA
      assert categoria.valid?
      #ce = categoria.errors.full_messages.inject("") do |memo,e|
      #  memo + e + ". "
      #end
      #Rails.logger.info "ce=#{ce}"
    end

    test "no valido" do
      categoria = Categoria.new PRUEBA_CATEGORIA
      categoria.nombre = ''
      assert_not categoria.valid?
      categoria.destroy
    end

    test "existente" do
      categoria = Sivel2Gen::Categoria.where(id: 10).take
      assert_equal categoria.nombre, "EJECUCIÓN EXTRAJUDICIAL"
    end

  end
end
