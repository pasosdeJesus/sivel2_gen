# encoding: UTF-8

require 'rails_helper'

module Sivel2Gen
  RSpec.describe ActividadesController, :type => :controller do
    routes { Sivel2Gen::Engine.routes }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:usuario]
      u = build(:usuario)
      controller.stub(:current_usuario).and_return(u)
    end

    it "should have a current_user" do
        expect(subject.current_usuario).not_to be_nil
    end
    # Atributos mínimos para crear una Actividad válida.
    let(:valid_attributes) {
      { minutos: "45", nombre: "nombreact", oficina_id: "1", 
        fecha: "2014-11-11", created_at: "2014-11-11" }
    }

    let(:invalid_attributes) {
      { minutos: "45", nombre: "", oficina_id: "1", 
        fecha: "2014-11-11", created_at: "2014-11-11" }
    }

    # Atributos mínimos de valores de sesión para pasar filtros (como 
    # autenticación) definidos en ActividadesController.
    # De http://luisalima.github.io/blog/2013/01/09/how-i-test-part-iv/
    let(:valid_session) { 
      {"warden.user.user.key" => session["warden.user.user.key"]}
    }

    describe "GET index" do
      it "asigna todas las actividades como @actividades" do
        actividad = Actividad.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:actividades)).to eq([actividad])
      end
    end

    describe "GET show" do
      it "asigna la actividad requerida como @actividad" do
        actividad = Actividad.create! valid_attributes
        get :show, {:id => actividad.to_param}, valid_session
        expect(assigns(:actividad)).to eq(actividad)
      end
    end

    describe "GET new" do
      it "asigna una nueva actividad como @actividad" do
        get :new, {}, valid_session
        expect(assigns(:actividad)).to be_a_new(Actividad)
      end
    end

    describe "GET edit" do
      it "asigna la actividad requerida como @actividad" do
        actividad = Actividad.create! valid_attributes
        get :edit, {:id => actividad.to_param}, valid_session
        expect(assigns(:actividad)).to eq(actividad)
      end
    end

    describe "POST create" do
      describe "con parámetros validos" do
        it "crea una Actividad" do
          expect {
            post :create, {:actividad => valid_attributes}, valid_session
          }.to change(Actividad, :count).by(1)
        end

        it "asigna la actividad recien creada como @actividad" do
          post :create, {:actividad => valid_attributes}, valid_session
          expect(assigns(:actividad)).to be_a(Actividad)
          expect(assigns(:actividad)).to be_persisted
        end

        it "redirige a la actividad creada" do
          post :create, {:actividad => valid_attributes}, valid_session
          expect(response).to redirect_to(Actividad.last)
        end
      end

      describe "con parámetros invalidos" do
        it "assigns a newly created but unsaved actividad as @actividad" do
          post :create, {:actividad => invalid_attributes}, valid_session
          expect(assigns(:actividad)).to be_a_new(Actividad)
        end

        it "vuelve a presentar la plantilla 'nueva'" do
          post :create, {:actividad => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "con parámetros válidos" do
        let(:new_attributes) {
          { minutos: "90", nombre: "nombreact2", oficina_id: "1", 
            fecha: "2014-11-18", created_at: "2014-11-18" }
        }

        it "actualiza la actividad requerida" do
          actividad = Actividad.create! valid_attributes
          put :update, {:id => actividad.to_param, :actividad => new_attributes}, valid_session
          actividad.reload
          expect(actividad.oficina_id).to eq(1)
        end

        it "asigna la actividad requerida como @actividad" do
          actividad = Actividad.create! valid_attributes
          put :update, {:id => actividad.to_param, :actividad => valid_attributes}, valid_session
          expect(assigns(:actividad)).to eq(actividad)
        end

        it "redirige a la actividad" do
          actividad = Actividad.create! valid_attributes
          put :update, {:id => actividad.to_param, :actividad => valid_attributes}, valid_session
          expect(response).to redirect_to(actividad)
        end
      end

      describe "con parametros inválidos" do
        it "asinga la actividad como @actividad" do
          actividad = Actividad.create! valid_attributes
          put :update, {:id => actividad.to_param, :actividad => invalid_attributes}, valid_session
          expect(assigns(:actividad)).to eq(actividad)
        end

        it "vuelve a presentar la plantilla 'editar'" do
          actividad = Actividad.create! valid_attributes
          put :update, {:id => actividad.to_param, :actividad => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "elimina la actividad requerida" do
        actividad = Actividad.create! valid_attributes
        expect {
          delete :destroy, {:id => actividad.to_param}, valid_session
        }.to change(Actividad, :count).by(-1)
      end

      it "redirige a la lista de actividades" do
        actividad = Actividad.create! valid_attributes
        delete :destroy, {:id => actividad.to_param}, valid_session
        expect(response).to redirect_to(actividades_url)
      end
    end

  end
end
