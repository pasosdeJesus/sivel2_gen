require "rails_helper"
require "admin/pconsolidados_controller"

RSpec.describe Admin::PconsolidadosController do
  render_views
  describe "index" do
    before(:each) do
      u = build(:usuario)
      #view.stub(:current_user).and_return(u)
      controller.stub(:current_user).and_return(u)
    end
    it "presenta plantilla de indice" do
      get :index
      expect(response).to render_template("index")
    end
    it "presenta plantailla widgets/index" do
      get :index
      expect(response).to render_template("admin/basicas/index")
    end
  end
end
