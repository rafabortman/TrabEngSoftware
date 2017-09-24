require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe JogadasController, type: :controller do

  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Criando objetos que serao usados de referencia nos testes  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  let(:jogobase) {Jogo.create({ titulo:"Jogo para testes",imagem:"https://www.mathworks.com/content/mathworks/www/en/solutions/verification-validation/jcr:content/svg.adapt.full.high.svg/1504126934803.svg", descricao:"Side scroller classico" })}
  let(:usuariobase) {Usuario.create({ nome:"TestUser",email:"testeemail@gmail.com", username:"testeemail",senha:"testeemail", nacionalidade:"tester" }) }
  
  let(:valid_attributes) {
    {
      texto_post:"Mario Bros",
      plataforma:"PC",
      data:"Side scroller classico",
      tempo_horas:1,
      tempo_minutos:10,
      tempo_segundos:37,
      categoria:"Classico",
      link:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fEaTMekrcz0\" frameborder=\"0\" allowfullscreen></iframe>",
      usuario_id:usuariobase.id,
      jogo_id:jogobase.id
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
