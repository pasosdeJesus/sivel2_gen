# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/actividades/show", :type => :view do
  before(:each) do
    @actividad = assign(:actividad, Sivel2Gen::Actividad.create!(
      :minutos => 1,
      :nombre => "Nombre",
      :objetivo => "Objetivo",
      :proyecto => "Proyecto",
      :resultado => "Resultado",
      :observaciones => "Observaciones",
      :fecha => '2014-11-20',
      :regionsjr_id => 1
    ))
  end

  it "presenta atributos en <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Objetivo/)
    expect(rendered).to match(/Proyecto/)
    expect(rendered).to match(/Resultado/)
    expect(rendered).to match(/Observaciones/)
    expect(rendered).to match(/2014-11-20/)
    expect(rendered).to match(/2/)
  end
end
