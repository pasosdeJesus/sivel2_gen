# encoding: UTF-8
require_relative '../../test_helper'

module Sivel2Gen
  class CategoriaTest < ActiveSupport::TestCase

    PRUEBA_CATEGORIA= {
      id: 1000, 
      nombre: "Categoria",
      supracategoria_id: 1,
      fechacreacion: "2014-09-09",
      created_at: "2014-09-09"
    }

    test "valido" do
      categoria = Categoria.create PRUEBA_CATEGORIA
      assert categoria.valid?
      categoria.destroy
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
