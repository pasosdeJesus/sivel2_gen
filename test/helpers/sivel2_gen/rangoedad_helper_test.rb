# encoding: utf-8

require_relative '../../test_helper'

module Sivel2Gen
  class RangoedadHelperTest < ActionView::TestCase

    test "edad_de_fechanac_fecha_n1" do
      assert_equal(-1, edad_de_fechanac_fecha(nil, 7, 20,
                                             2019, 10, 5))
    end

    test "edad_de_fechanac_fecha_n2" do
      assert_equal(-1, edad_de_fechanac_fecha(1973, 7, 20,
                                             nil, 10, 5))
    end

    test "edad_de_fechanac_fecha_n3" do
      assert_equal(46, edad_de_fechanac_fecha(1973, nil, 20,
                                             2019, 10, 5))
    end

    test "edad_de_fechanac_fecha_n4" do
      assert_equal(46, edad_de_fechanac_fecha(1973, 7, 20,
                                             2019, nil, 5))
    end

    test "edad_de_fechanac_fecha_n5" do
      assert_equal(46, edad_de_fechanac_fecha(1973, 7, nil,
                                             2019, 7, 5))
    end

    test "edad_de_fechanac_fecha_n6" do
      assert_equal(46, edad_de_fechanac_fecha(1973, 7, 20,
                                             2019, 7, nil))
    end

    test "edad_de_fechanac_fecha_d1" do
      assert_equal(46, edad_de_fechanac_fecha(1973, 7, 20,
                                             2019, 10, 5))
    end

    test "edad_de_fechanac_fecha_d2" do
      assert_equal(46, edad_de_fechanac_fecha(1973, 7, 20,
                                             2019, 7, 20))
    end

    test "edad_de_fechanac_fecha_d3" do
      assert_equal(45, edad_de_fechanac_fecha(1973, 7, 20,
                                             2019, 7, 19))
    end

    test "edad_de_fechanac_fecha_d4" do
      assert_equal(45, edad_de_fechanac_fecha(1973, 7, 20,
                                             2019, 1, 10))
    end

    test "edad_de_fechanac_fecha_d5" do
      assert_equal(45, edad_de_fechanac_fecha(1973, 7, 20,
                                              2018, 12, 10))
    end

    test "buscar_rango_edad_n1" do
      assert_equal(-1, buscar_rango_edad(-1, nil))
    end

    test "buscar_rango_edad_n2" do
      assert_equal(-1, buscar_rango_edad(-1, 'ModeloLoco'))
    end

    test "buscar_rango_edad_n3" do
      assert_equal(6, buscar_rango_edad(-1, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r1_1" do
      assert_equal(1, buscar_rango_edad(0, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r1_2" do
      assert_equal(1, buscar_rango_edad(7, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r1_3" do
      assert_equal(1, buscar_rango_edad(15, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r2_1" do
      assert_equal(2, buscar_rango_edad(16, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r2_2" do
      assert_equal(2, buscar_rango_edad(20, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r2_3" do
      assert_equal(2, buscar_rango_edad(25, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r3_1" do
      assert_equal(3, buscar_rango_edad(26, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r3_2" do
      assert_equal(3, buscar_rango_edad(40, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r3_3" do
      assert_equal(3, buscar_rango_edad(45, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r4_1" do
      assert_equal(4, buscar_rango_edad(46, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r4_2" do
      assert_equal(4, buscar_rango_edad(56, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r4_3" do
      assert_equal(4, buscar_rango_edad(60, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r5_1" do
      assert_equal(5, buscar_rango_edad(61, 'Sivel2Gen::Rangoedad'))
    end

    test "buscar_rango_edad_r5_2" do
      assert_equal(5, buscar_rango_edad(100, 'Sivel2Gen::Rangoedad'))
    end

  end
end
