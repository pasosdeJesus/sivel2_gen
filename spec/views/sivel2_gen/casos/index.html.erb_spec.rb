# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/casos/index", :type => :view do
  before(:each) do
    assign(:caso, [
      Sivel2Gen::Caso.create!(
        fecha: "2014-11-05",
        memo: "",
        created_at: "2014-11-20"
      ),
      Sivel2Gen::Caso.create!(
        fecha: "2014-11-05",
        memo: "",
        created_at: "2014-11-20"
      )
    ])
    assign(:conscaso, Sivel2Gen::Conscaso.all)
  end

  #it "presenta lista de casos" do
    #render
    #assert_select "tr>td", :text => 2014-11-05.to_s, :count => 2
    #assert_select "tr>td", :text => "2014-11-20".to_s, :count => 2
  #end
  #  Probar json
end
