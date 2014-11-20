# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/actividades/new", :type => :view do
  before(:each) do
    assign(:actividad, Sivel2Gen::Actividad.new(
      :minutos => 1,
      :nombre => "MyString",
      :objetivo => "MyString",
      :proyecto => "MyString",
      :resultado => "MyString",
      :observaciones => "MyString",
      :fecha => '2014-11-20',
      :regionsjr_id => 1
    ))
  end

  it "presenta el formulario de una nueva actividad" do
    render

    assert_select "form[action=?][method=?]", sivel2_gen.actividades_path, "post" do

      assert_select "input#actividad_minutos[name=?]", "actividad[minutos]"

      assert_select "input#actividad_nombre[name=?]", "actividad[nombre]"

      assert_select "input#actividad_objetivo[name=?]", "actividad[objetivo]"

      assert_select "input#actividad_proyecto[name=?]", "actividad[proyecto]"

      assert_select "input#actividad_resultado[name=?]", "actividad[resultado]"

      assert_select "input#actividad_observaciones[name=?]", "actividad[observaciones]"
      assert_select "select#actividad_regionsjr_id[name=?]", "actividad[regionsjr_id]"
    end
  end
end
