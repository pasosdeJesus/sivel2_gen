require "spec_helper"
require "rails_helper"

describe Sivel2Gen::Admin::PconsolidadosController do
  routes { Sivel2Gen::Engine.routes }
  # https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/engine-routes-for-controllers
  render_views
  describe "index" do
    before(:each) do
      @routes = Sivel2Gen::Engine.routes
      u = build(:usuario)
      controller.stub(:current_usuario).and_return(u)
    end
    it "presenta plantilla de indice" do
      get :index
      expect(response).to render_template("index")
    end
    it "presenta plantilla widgets/index" do
      get :index
      expect(response).to render_template("admin/basicas/index")
    end
  end
end
