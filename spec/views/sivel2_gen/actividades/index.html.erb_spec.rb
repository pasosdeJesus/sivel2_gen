# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/actividades/index", :type => :view do
  before(:each) do
    assign(:actividades, [
      Sivel2Gen::Actividad.create!(
        :minutos => 1,
        :nombre => "Nombre",
        :objetivo => "Objetivo",
        :proyecto => "Proyecto",
        :resultado => "Resultado",
        :observaciones => "Observaciones",
        :fecha => "2014-11-20",
        :regionsjr_id => 2
      ),
      Sivel2Gen::Actividad.create!(
        :minutos => 1,
        :nombre => "Nombre",
        :objetivo => "Objetivo",
        :proyecto => "Proyecto",
        :resultado => "Resultado",
        :observaciones => "Observaciones",
        :fecha => "2014-11-20",
        :regionsjr_id => 2
      )
    ])
  end

#  it "presenta lista de actividades" do
#    render
#    assert_select "tr>td", :text => 1.to_s, :count => 2
#    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
#    assert_select "tr>td", :text => "Objetivo".to_s, :count => 2
#    assert_select "tr>td", :text => "Proyecto".to_s, :count => 2
#    assert_select "tr>td", :text => "Resultado".to_s, :count => 2
#    assert_select "tr>td", :text => "Observaciones".to_s, :count => 2
#    assert_select "tr>td", :text => "2014-11-20".to_s, :count => 2
#    assert_select "tr>td", :text => 2.to_s, :count => 2
#  end
  #  Probar json
end
