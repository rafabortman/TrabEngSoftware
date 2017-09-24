require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe GenerosController, type: :controller do

  let(:valid_attributes) {
    {
      nome:"Sidescroller"
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")    
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      genero = Genero.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      genero = Genero.create! valid_attributes
      get :show, params: {id: genero.to_param}, session: valid_session
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
      genero = Genero.create! valid_attributes
      get :edit, params: {id: genero.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Genero" do
        expect {
          post :create, params: {genero: valid_attributes}, session: valid_session
        }.to change(Genero, :count).by(1)
      end

      it "redirects to the created genero" do
        post :create, params: {genero: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Genero.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {genero: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested genero" do
        genero = Genero.create! valid_attributes
        put :update, params: {id: genero.to_param, genero: new_attributes}, session: valid_session
        genero.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the genero" do
        genero = Genero.create! valid_attributes
        put :update, params: {id: genero.to_param, genero: valid_attributes}, session: valid_session
        expect(response).to redirect_to(genero)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        genero = Genero.create! valid_attributes
        put :update, params: {id: genero.to_param, genero: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested genero" do
      genero = Genero.create! valid_attributes
      expect {
        delete :destroy, params: {id: genero.to_param}, session: valid_session
      }.to change(Genero, :count).by(-1)
    end

    it "redirects to the generos list" do
      genero = Genero.create! valid_attributes
      delete :destroy, params: {id: genero.to_param}, session: valid_session
      expect(response).to redirect_to(generos_url)
    end
  end

end
