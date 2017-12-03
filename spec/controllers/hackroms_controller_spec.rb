require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe HackromsController, type: :controller do

 
  @jogoTest = Jogo.find_by(titulo:"TestHacks")
  if @jogoTest!=nil
    @jogoTest.destroy
  end
  Jogo.create({
    titulo:"TestHacks", 
    imagem_url:"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd", 
    descricao:"AAAA"}
  )

  let(:valid_attributes) {
    {
      nomeRom:"Pederneiras",
      jogo_id:Jogo.find_by(titulo:"TestHacks").id
    }
  }

  let(:invalid_attributes) {
    {
      nomeRom:"",
      jogo_id:Jogo.find_by(titulo:"TestHacks").id
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HackromsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      hackrom = Hackrom.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      hackrom = Hackrom.create! valid_attributes
      get :show, params: {id: hackrom.to_param}, session: valid_session
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
      hackrom = Hackrom.create! valid_attributes
      get :edit, params: {id: hackrom.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Hackrom" do
        expect {
          post :create, params: {hackrom: valid_attributes}, session: valid_session
        }.to change(Hackrom, :count).by(1)
      end

      it "redirects to the created hackrom" do
        post :create, params: {hackrom: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Hackrom.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {hackrom: invalid_attributes}, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          nomeRom:"Chocante",
          jogo_id:Jogo.find_by(titulo:"TestHacks").id
        }
      }

      it "updates the requested hackrom" do
        hackrom = Hackrom.create! valid_attributes
        put :update, params: {id: hackrom.to_param, hackrom: new_attributes}, session: valid_session
        hackrom.reload
        Hackrom.find_by(id:hackrom.id)
        expect(Hackrom.find_by(id:hackrom.id).nomeRom).to eq("Chocante")
      end

      it "redirects to the hackrom" do
        hackrom = Hackrom.create! valid_attributes
        put :update, params: {id: hackrom.to_param, hackrom: valid_attributes}, session: valid_session
        expect(response).to redirect_to(hackrom)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        hackrom = Hackrom.create! valid_attributes
        put :update, params: {id: hackrom.to_param, hackrom: invalid_attributes}, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested hackrom" do
      hackrom = Hackrom.create! valid_attributes
      expect {
        delete :destroy, params: {id: hackrom.to_param}, session: valid_session
      }.to change(Hackrom, :count).by(-1)
    end

    it "redirects to the hackroms list" do
      hackrom = Hackrom.create! valid_attributes
      delete :destroy, params: {id: hackrom.to_param}, session: valid_session
      expect(response).to redirect_to(hackroms_url)
    end
  end

end
