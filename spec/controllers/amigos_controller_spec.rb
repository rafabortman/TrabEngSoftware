require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe AmigosController, type: :controller do
  let(:valid_attributes) {
    {
      usuarioId:"Mark",
      amigoId:"Elon"
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
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
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {amigo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested amigo" do
        amigo = Amigo.create! valid_attributes
        put :update, params: {id: amigo.to_param, amigo: new_attributes}, session: valid_session
        amigo.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the amigo" do
        amigo = Amigo.create! valid_attributes
        put :update, params: {id: amigo.to_param, amigo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(amigo)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        amigo = Amigo.create! valid_attributes
        put :update, params: {id: amigo.to_param, amigo: invalid_attributes}, session: valid_session
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
  end

end
