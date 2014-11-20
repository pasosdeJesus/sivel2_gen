# encoding: UTF-8
require 'rails_helper'

RSpec.describe "sivel2_gen/casos/edit", :type => :view do
  let(:current_usuario) { build(:usuario) }
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:usuario]
    controller.stub(:current_usuario).and_return(current_usuario)
    current_usuario.save!
    @caso = assign(:caso, Sivel2Gen::Caso.create!(
      fecha: "2014-11-05",
      memo: "",
      created_at: "2014-11-20"
    ))
  end

  after(:each) do
    current_usuario.delete
  end


  it "presenta el formulario para editar caso" do
    render
    assert_select "form[action=?][method=?]", sivel2_gen.caso_path(@caso), "post" do

      assert_select "input#caso_fecha[name=?]", "caso[fecha]"

      assert_select "textarea#caso_memo[name=?]", "caso[memo]"

    end
  end
end
