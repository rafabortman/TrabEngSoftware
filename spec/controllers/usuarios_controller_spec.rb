require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe UsuariosController, type: :controller do

  let(:valid_attributes) {
    {
      nome:"Olar",
      email:"olar123@gmail.com",
      username:"brhue",
      senha:"olar123",
      nacionalidade:"soubr",
      confirmar_senha:"olar123",
      imagem_perfil:"dsasd"
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

  describe "GET #buscar" do
    it "returns a success response" do
      get :buscar, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #mostrarResultados" do
    it "returns a list of existing users" do

      post :create, params: {usuario: valid_attributes}, session: valid_session
      post :create, params: {usuario:{nome:"Jonas", email:"jonasdeveloper@gmail.com", username:"johndev", senha:"fullstack", confirmar_senha:"fullstack",nacionalidade:"Brasileiro"}, session: valid_session}
      post :mostrarResultados, params:{username:"john"},:format => :json
      result = JSON.parse(response.body)
      result.size.should eq(1)
      response.should be_ok
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
        {
          nome:"NomeNovo",
          email:"olar123@gmail.com",
          username:"brhue",
          senha:"olar123",
          nacionalidade:"soubr",
          confirmar_senha:"olar123"
        }
      }

      it "updates the requested usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, params: {id: usuario.to_param, usuario: new_attributes}, session: valid_session
        usuario.reload
        expect(Usuario.find_by(email:"olar123@gmail.com").nome).to eq("NomeNovo")
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
