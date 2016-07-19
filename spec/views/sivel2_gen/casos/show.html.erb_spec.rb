# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/casos/show", :type => :view do
  before(:each) do
    skip
    @caso = assign(:caso, Sivel2Gen::Caso.create!(
      fecha: "2014-11-05",
      memo: "",
      created_at: "2014-11-20"
    ))
  end

  it "presenta atributros en <p>" do
    render
    expect(rendered).to match(/2014-11-05/)
    expect(rendered).to match(/2014-11-20/)
  end
end
