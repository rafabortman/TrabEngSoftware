require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe JogadasController, type: :controller do
  Usuario.create({
    nome:"Usuario Teste Jogadas Rspec",
    email:"test@gmail.com",
    username:"tsttst",
    senha:"tester",
    nacionalidade:"br"

  });
  Jogo.create({
      titulo:"Jogo Teste Jogadas Rspec",
      imagem_url:"https://s3.minijuegosgratis.com/media/video-collection-img/video-collection-super-mario-run-thumb.jpg",
      descricao:"Side scroller classico"      
  })

  let(:valid_attributes) {
    {
      texto_post:"Mario Bros",
      plataforma:"PC",
      data:"Side scroller classico",
      tempo_horas:1,
      tempo_minutos:10,
      tempo_segundos:37,
      categoria:"Classico",
      link:"https://www.youtube.com/embed/fEaTMekrcz0",
      usuario_id: Usuario.find_by(nome: "Usuario Teste Jogadas Rspec").id,
      jogo_id: Jogo.find_by(titulo: "Jogo Teste Jogadas Rspec").id
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
     subject {
          Jogada.new(valid_attributes)
      } 
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      jogada = Jogada.create! valid_attributes
      get :show, params: {id: jogada.to_param}, session: valid_session
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
      jogada = Jogada.create! valid_attributes
      get :edit, params: {id: jogada.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Jogada" do
        expect {
          post :create, params: {jogada: valid_attributes}, session: valid_session
        }.to change(Jogada, :count).by(1)
      end

      it "redirects to the created jogada" do
        post :create, params: {jogada: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Jogada.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {jogada: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested jogada" do
        jogada = Jogada.create! valid_attributes
        put :update, params: {id: jogada.to_param, jogada: new_attributes}, session: valid_session
        jogada.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the jogada" do
        jogada = Jogada.create! valid_attributes
        put :update, params: {id: jogada.to_param, jogada: valid_attributes}, session: valid_session
        expect(response).to redirect_to(jogada)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        jogada = Jogada.create! valid_attributes
        put :update, params: {id: jogada.to_param, jogada: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested jogada" do
      jogada = Jogada.create! valid_attributes
      expect {
        delete :destroy, params: {id: jogada.to_param}, session: valid_session
      }.to change(Jogada, :count).by(-1)
    end

    it "redirects to the jogadas list" do
      jogada = Jogada.create! valid_attributes
      delete :destroy, params: {id: jogada.to_param}, session: valid_session
      expect(response).to redirect_to(jogadas_url)
    end
  end

end
