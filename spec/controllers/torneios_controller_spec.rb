require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe TorneiosController, type: :controller do

  @jogoTest = Jogo.find_by(titulo:"TestTournament")
  if @jogoTest!=nil
    @jogoTest.destroy
  end
  Jogo.create!({
    titulo:"TestTournament", 
    imagem_url:"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd", 
    descricao:"AAAA"}
  )
  
  let(:valid_attributes) {
    {
      titulo:"TorneioTeste",
      data_inicio:DateTime.now + 10.days,
      data_fim:DateTime.now + 12.days,
      regras:"THERE ARE NO RULES",
      jogo_id:Jogo.find_by(titulo: "TestTournament").id
    } 
  }

  let(:invalid_attributes) {
    {
      titulo:"TorneioTesteFalso",
      data_inicio:DateTime.now + 10.days,
      data_fim:DateTime.now + 10.days,
      regras:"THERE ARE NO RULES",
      jogo_id:Jogo.find_by(titulo: "TestTournament").id
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TorneiosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      torneio = Torneio.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      torneio = Torneio.create! valid_attributes
      get :show, params: {id: torneio.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      torneio = Torneio.create! valid_attributes
      get :edit, params: {id: torneio.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Torneio" do
        expect {
          post :create, params: {torneio: valid_attributes}
        }.to change(Torneio, :count).by(1)
      end

      it "redirects to the created torneio" do
        post :create, params: {torneio: valid_attributes}
        expect(response).to redirect_to(Torneio.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {torneio: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          titulo:"TorneioTeste",
          data_inicio:DateTime.now + 15.days,
          data_fim:DateTime.now + 17.days,
          regras:"THERE ARE SOME RULES",
          jogo_id:Jogo.find_by(titulo: "TestTournament").id
        } 
      }

      it "updates the requested torneio" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param, torneio: new_attributes}
        torneio.reload
        torneioUpdated = Torneio.find_by(titulo:"TorneioTeste")
        expect(torneioUpdated.regras).to eq("THERE ARE SOME RULES")
      end

      it "redirects to the torneio" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param, torneio: valid_attributes}
        expect(response).to redirect_to(torneio)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param, torneio: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested torneio" do
      torneio = Torneio.create! valid_attributes
      expect {
        delete :destroy, params: {id: torneio.to_param}
      }.to change(Torneio, :count).by(-1)
    end

    it "redirects to the torneios list" do
      torneio = Torneio.create! valid_attributes
      delete :destroy, params: {id: torneio.to_param}
      expect(response).to redirect_to(torneios_url)
    end
  end

end
