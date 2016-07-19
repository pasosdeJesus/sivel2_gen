# encoding: UTF-8

require 'rails_helper'

module Sivel2Gen
  RSpec.describe CasosController, :type => :controller do
    routes { Sivel2Gen::Engine.routes }
    let(:current_usuario) { build(:usuario) }
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:usuario]
      controller.stub(:current_usuario).and_return(current_usuario)
      current_usuario.save!
    end

    after(:each) do
      current_usuario.delete
    end

    # Atributos mínimos para crear una Caso válida.
    let(:valid_attributes) {
      { fecha: "2014-11-19", memo: "", created_at: "2014-11-11" }
    }

    let(:invalid_attributes) {
      { fecha: nil, memo: "", created_at: "2014-11-11" }
    }

    # Atributos mínimos de valores de sesión para pasar filtros (como 
    # autenticación) definidos en CasosController.
    let(:valid_session) { 
      {"warden.user.user.key" => session["warden.user.user.key"]}
    }

    describe "GET index" do
      it "asigna todas los casos como @casos" do
        caso = Caso.create!(valid_attributes)
        #get :index, {}, valid_session
        get :index, params: {}, session: valid_session
        expect(assigns(:casos)).to eq([caso])
      end
    end

    describe "GET show" do
      it "asigna el caso requerida como @caso" do
        caso = Caso.create! valid_attributes
        #get :show, params: {:id => caso.to_param}, valid_session
        get :show, params: {:id => caso.to_param}, session: valid_session
        expect(assigns(:caso)).to eq(caso)
      end
    end

#    describe "GET new" do
#      it "asigna un nuevo caso como @caso" do
#        get :new, params: {}, session: valid_session
#        expect(assigns(:caso)).to be_a_new(Caso)
#      end
#    end

    describe "GET edit" do
      it "asigna el caso requerida como @caso" do
        caso = Caso.create! valid_attributes
        #get :edit, params: {:id => caso.to_param}, valid_session
        get :edit, params: {:id => caso.to_param}, session: valid_session
        expect(assigns(:caso)).to eq(caso)
      end
    end

    describe "POST create" do
      describe "con parámetros validos" do
#        it "crea una Caso" do
#          expect {
#            post :create, params: {:caso => valid_attributes}, session: valid_session
#          }.to change(Caso, :count).by(1)
#        end

#       it "asigna el caso recien creado como @caso" do
#  post :create, params: {:caso => valid_attributes}, session: valid_session
#          expect(assigns(:caso)).to be_a(Caso)
#          expect(assigns(:caso)).to be_persisted
#        end

#        it "redirige a el caso creado" do
#          post :create, params: {:caso => valid_attributes}, session: valid_session
#          expect(response).to redirect_to(Caso.last)
#        end
      end

      describe "con parámetros invalidos" do
        it "assigns a newly created but unsaved caso as @caso" do
          post :create, params: {:caso => invalid_attributes}, session: valid_session
          expect(assigns(:caso)).to be_a_new(Caso)
        end

        it "vuelve a presentar la plantilla 'nueva'" do
          post :create, params: {:caso => invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "con parámetros válidos" do
        let(:new_attributes) {
            { fecha: "2014-11-18", memo: "memo2", created_at: "2014-11-18" }
        }

        it "actualiza el caso requerida" do
          caso = Caso.create! valid_attributes
          put :update, params: {:id => caso.to_param, :caso => new_attributes}, session: valid_session
          caso.reload
          expect(caso.memo).to eq("memo2")
        end

        it "asigna el caso requerida como @caso" do
          caso = Caso.create! valid_attributes
          put :update, params: {:id => caso.to_param, :caso => valid_attributes}, session: valid_session
          expect(assigns(:caso)).to eq(caso)
        end

        it "redirige a el caso" do
          caso = Caso.create! valid_attributes
          put :update, params: {:id => caso.to_param, :caso => valid_attributes}, session: valid_session
          expect(response).to redirect_to(caso)
        end
      end

      describe "con parametros inválidos" do
        it "asinga el caso como @caso" do
          caso = Caso.create! valid_attributes
          put :update, params: {:id => caso.to_param, :caso => invalid_attributes}, session: valid_session
          expect(assigns(:caso)).to eq(caso)
        end

        it "vuelve a presentar la plantilla 'editar'" do
          caso = Caso.create! valid_attributes
          put :update, params: {:id => caso.to_param, :caso => invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "elimina el caso requerida" do
        caso = Caso.create! valid_attributes
        expect {
          delete :destroy, params: {:id => caso.to_param}, session: valid_session
        }.to change(Caso, :count).by(-1)
      end

      it "redirige a la lista de casos" do
        caso = Caso.create! valid_attributes
        delete :destroy, params: {:id => caso.to_param}, session: valid_session
        expect(response).to redirect_to(casos_url)
      end
    end

  end
end
