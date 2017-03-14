# encoding: UTF-8
require_relative '../../test_helper'

module Sivel2Gen
  class ActividadoficioTest < ActiveSupport::TestCase

    PRUEBA_ACTIVIDADOFICIO= {
      nombre:"n",
      fechacreacion:"2014-08-05",
      fechadeshabilitacion:nil
    }


    test "valido" do
      actividadoficio = Actividadoficio.create PRUEBA_ACTIVIDADOFICIO
      assert actividadoficio.valid?
      actividadoficio.destroy
    end

    test "no valido" do
      actividadoficio = Actividadoficio.new PRUEBA_ACTIVIDADOFICIO
      actividadoficio.nombre = ''
      assert_not actividadoficio.valid?
      actividadoficio.destroy
    end

    test "existente" do
    	actividadoficio = Actividadoficio.where(id: 0).take
      assert_equal actividadoficio.nombre, "SIN INFORMACIÓN"
    end

  end
end
