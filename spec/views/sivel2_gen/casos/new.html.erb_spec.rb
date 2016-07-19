# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/casos/new", :type => :view do
  let(:current_usuario) { build(:usuario) }
  let(:caso_id) { -1 }
  before(:each) do
    skip
    @request.env["devise.mapping"] = Devise.mappings[:usuario]
    controller.stub(:current_usuario).and_return(current_usuario)
    current_usuario.save!
    assign(:caso, Sivel2Gen::Caso.create!(
      fecha: "2014-11-05",
      memo: "",
      created_at: "2014-11-20"
    ))
  end

  after(:each) do
    current_usuario.delete
  end


  it "presenta el formulario de un nuevo caso" do
    render
    assert_select "form[action^=?][method=?]", sivel2_gen.casos_path, "post" do

      assert_select "input#caso_fecha[name=?]", "caso[fecha]"

      assert_select "textarea#caso_memo[name=?]", "caso[memo]"

    end
  end
end
