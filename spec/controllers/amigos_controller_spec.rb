require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe AmigosController, type: :controller do

   Usuario.create({
      nome:"Joaoqe",
      email:"comida00999@gmail.com",
      username:"j1qqwesnow",
      senha:"kingofthenorth",
      nacionalidade:"kingofthenorth",
      confirmar_senha:"kingofthenorth",
      imagem_perfil:"asdsd"
    });

   Usuario.create({
      nome:"Jo123fgao",
      email:"teste12333@gmail.com",
      username:"g23dhnsnow",
      senha:"kingofthenorth",
      nacionalidade:"kingofthenorth",
      confirmar_senha:"kingofthenorth",
      imagem_perfil:"asdsd"
    });

  let(:valid_attributes) {
    {
      usuario_id: Usuario.find_by(username: "j1qqwesnow").id,
      amigo_id: Usuario.find_by(username: "g23dhnsnow").id
    }
  }

  let(:invalid_attributes) {
    {
      usuario_id: -1,
      amigo_id: "chico"
    }
  }

  let(:valid_session) { {} }


  describe "GET #index" do
    it "returns a success response" do
      amigo = Amigo.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      amigo = Amigo.create! valid_attributes
      get :show, params: {id: amigo.to_param}, session: valid_session
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
      amigo = Amigo.create! valid_attributes
      get :edit, params: {id: amigo.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Amigo" do
        expect {
          post :create, params: {amigo: valid_attributes}, session: valid_session
        }.to change(Amigo, :count).by(1)
      end

      it "redirects to the created amigo" do
        post :create, params: {amigo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Amigo.last)
      end

      it "tentar seguir 2 vezes" do
         count = Amigo.count
         post :create, params: {amigo: valid_attributes}, session: valid_session
         post :create, params: {amigo: valid_attributes}, session: valid_session
         expect(Amigo.count).to eq(count+1)
      end

    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {amigo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested amigo" do
      amigo = Amigo.create! valid_attributes
      expect {
        delete :destroy, params: {id: amigo.to_param}, session: valid_session
      }.to change(Amigo, :count).by(-1)
    end

    it "redirects to the amigos list" do
      amigo = Amigo.create! valid_attributes
      delete :destroy, params: {id: amigo.to_param}, session: valid_session
      expect(response).to redirect_to(amigos_url)
    end

    it "passando id do usuario e do amigo" do
      amigo = Amigo.create! valid_attributes
      expect {
      delete "deletar",params: {amigo: {usuario_id: amigo.usuario_id, amigo_id: amigo.amigo_id}}, session: valid_session
      }.to change(Amigo, :count).by(-1)
    end
  end
end
