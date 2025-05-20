# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../models/sivel2_gen/caso_test"

module Msip
  class UbicacionHelperTest < ActionView::TestCase
    include Sivel2Gen::UbicacionHelper

    def contexto_p
      @caso = Sivel2Gen::Caso.create(PRUEBA_CASO)
      @pais = Pais.find(862)
      @ubicacion = Ubicacion.create({
        pais: @pais,
        caso: @caso,
      })
    end

    test "simple" do
      contexto_p

      assert @ubicacion.valid?
    end

    test "nombre con sólo país" do
      contexto_p

      assert_equal "Venezuela", formato_ubicacion(@ubicacion)
    end

    def contexto_d
      contexto_p
      @departamento = Departamento.find_by(id: 1)
      @ubicacion.departamento_id = @departamento.id
    end

    test "nombre con pais y departamento" do
      contexto_d

      assert_equal "Venezuela / Distrito Capital",
        formato_ubicacion(@ubicacion)
    end

    def contexto_m
      contexto_d
      @municipio = Municipio.find_by(id: 25)
      @ubicacion.municipio_id = @municipio.id
    end

    test "nombre con municipio" do
      contexto_m

      assert_equal "Venezuela / Distrito Capital / Bolivariano Libertador",
        formato_ubicacion(@ubicacion)
    end

    def contexto_c
      contexto_m
      @centropoblado = Centropoblado.find_by(municipio_id: 25)
      @ubicacion.centropoblado_id = @centropoblado.id
    end

    test "no incluye centropoblado" do
      contexto_c

      assert_equal "Venezuela / Distrito Capital / Bolivariano Libertador",
        formato_ubicacion(@ubicacion, false)
    end

    test "incluye centropoblado" do
      contexto_c

      assert_equal "Venezuela / Distrito Capital / Bolivariano Libertador / Caracas",
        formato_ubicacion(@ubicacion)
    end
  end  # class
end    # module
