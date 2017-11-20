require 'rails_helper'



RSpec.describe TorneiosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Torneio. As you add validations to Torneio, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TorneiosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      torneio = Torneio.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      torneio = Torneio.create! valid_attributes
      get :show, params: {id: torneio.to_param}, session: valid_session
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
      torneio = Torneio.create! valid_attributes
      get :edit, params: {id: torneio.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Torneio" do
        expect {
          post :create, params: {torneio: valid_attributes}, session: valid_session
        }.to change(Torneio, :count).by(1)
      end

      it "redirects to the created torneio" do
        post :create, params: {torneio: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Torneio.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {torneio: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested torneio" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param, torneio: new_attributes}, session: valid_session
        torneio.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the torneio" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param, torneio: valid_attributes}, session: valid_session
        expect(response).to redirect_to(torneio)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param, torneio: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested torneio" do
      torneio = Torneio.create! valid_attributes
      expect {
        delete :destroy, params: {id: torneio.to_param}, session: valid_session
      }.to change(Torneio, :count).by(-1)
    end

    it "redirects to the torneios list" do
      torneio = Torneio.create! valid_attributes
      delete :destroy, params: {id: torneio.to_param}, session: valid_session
      expect(response).to redirect_to(torneios_url)
    end
  end

end
