require "rails_helper"
require "sivel2_gen/admin/pconsolidados_controller"

module Sivel2Gen
  RSpec.describe Admin::PconsolidadosController do
    render_views
    describe "index" do
      before(:each) do
        u = build(:usuario)
        #view.stub(:current_user).and_return(u)
        controller.stub(:current_user).and_return(u)
      end
      it "presenta plantilla de indice" do
        get :index, use_route: :sivel2_gen
        expect(response).to render_template("index")
      end
      it "presenta plantilla widgets/index" do
        get :index, use_route: :sivel2_gen
        expect(response).to render_template("admin/basicas/index")
      end
    end
  end
end
