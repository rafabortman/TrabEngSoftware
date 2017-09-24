require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe UsuariosController, type: :controller do

  let(:valid_attributes) {
    {
      nome:"Joao",
      email:"joaoneves@gmail.com",
      username:"johnsnow",
      senha:"kingofthenorth",
      nacionalidade:"kingofthenorth"

    }
  }

  let(:invalid_attributes) {
    {
      email:"joaoneves"
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      usuario = Usuario.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      usuario = Usuario.create! valid_attributes
      get :show, params: {id: usuario.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      usuario = Usuario.create! valid_attributes
      get :edit, params: {id: usuario.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Usuario" do
        expect {
          post :create, params: {usuario: valid_attributes}, session: valid_session
        }.to change(Usuario, :count).by(1)
      end

      it "redirects to the created usuario" do
        post :create, params: {usuario: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Usuario.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {usuario: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, params: {id: usuario.to_param, usuario: new_attributes}, session: valid_session
        usuario.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, params: {id: usuario.to_param, usuario: valid_attributes}, session: valid_session
        expect(response).to redirect_to(usuario)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        usuario = Usuario.create! valid_attributes
        put :update, params: {id: usuario.to_param, usuario: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested usuario" do
      usuario = Usuario.create! valid_attributes
      expect {
        delete :destroy, params: {id: usuario.to_param}, session: valid_session
      }.to change(Usuario, :count).by(-1)
    end

    it "redirects to the usuarios list" do
      usuario = Usuario.create! valid_attributes
      delete :destroy, params: {id: usuario.to_param}, session: valid_session
      expect(response).to redirect_to(usuarios_url)
    end
  end

end
