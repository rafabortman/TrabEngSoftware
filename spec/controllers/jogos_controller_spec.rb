require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe JogosController, type: :controller do

  Genero.create({
    nome: "Acao"
    });

  Genero.create({
    nome: "Tiro"
    });

  let(:valid_attributes) {
    {
      titulo:"Mario Bros",
      imagem_url:"https://s3.minijuegosgratis.com/media/video-collection-img/video-collection-super-mario-run-thumb.jpg",
      descricao:"Side scroller classico"      
    }
  }

  let(:valid_attributes2) {
    {
      titulo:"Mario Bros 2",
      imagem_url:"https://s3.minijuegosgratis.com/media/video-collection-img/video-collection-super-mario-run-thumb.jpg",
      descricao:"AAAA"      
    }
  }

  let(:invalid_attributes) {
    {
    titulo:"Mario Bros 3",
    imagem_url:"https://DanielOlhaEsseTesteEDa10HEHEHE.com.br",
    descricao:"BAKABAKABAKA"
    }
  }

  
  let(:valid_session) { {} }

  describe "Generos" do
    gen1 = Genero.find_by(nome: "Tiro")
    gen2 = Genero.find_by(nome: "Acao")
    it "adicionar generos" do
      #relacao JogosGenero nao pode ter relacoes
      jogo = Jogo.create valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
      expect(jogo.generos.count).to eq(0)
      expect(JogosGenero.count).to eq(0)
      #add 1 genero
      put :update, params: {id: jogo.id, jogo: valid_attributes, genero_ids: [gen1.id]}, session: valid_session
      expect(response).to redirect_to(jogo)
      expect(jogo.generos.count).to eq(1)
      expect(JogosGenero.count).to eq(1)
      #trocar gen1 por gen2 (O jogoGenero que conecta gen1 ao jogo deve ser excluido e um novo para gen2 criado)
      put :update, params: {id: jogo.id, jogo: valid_attributes, genero_ids: [gen2.id]}, session: valid_session
      expect(response).to redirect_to(jogo)
      expect(jogo.generos.count).to eq(1)
      expect(JogosGenero.count).to eq(1)
      #adicionar os 2
      put :update, params: {id: jogo.id, jogo: valid_attributes, genero_ids: [gen2.id,gen1.id]}, session: valid_session
      expect(response).to redirect_to(jogo)
      expect(jogo.generos.count).to eq(2)   
      expect(JogosGenero.count).to eq(2)  
    end

    it "criar e deletar jogo com os generos" do
    post :create, params: {jogo: valid_attributes, genero_ids: [gen1.id,gen2.id]}, session: valid_session
    expect(JogosGenero.count).to eq(2) 
    expect(gen1.jogos.count).to eq(1)
    expect(gen2.jogos.count).to eq(1)
    delete :destroy, params: {id: Jogo.find_by(titulo: "Mario Bros")}, session: valid_session
    expect(JogosGenero.count).to eq(0) 
    expect(gen1.jogos.count).to eq(0)
    expect(gen2.jogos.count).to eq(0)
    end
  end

  describe "Jogos repetidos" do
  it "add 2 jogos" do
     nrJogos = Jogo.count
     jogo1 = Jogo.create valid_attributes
     jogo2 = Jogo.create valid_attributes
     expect(Jogo.count).to eq(nrJogos+1)
  end
  it "impedir update em jogo que deixa titulo igual a outro" do
     nrJogos = Jogo.count
     jogo1 = Jogo.create valid_attributes
     jogo2 = Jogo.create valid_attributes2
     titul = jogo2.titulo
     post :update, params: {id: jogo2.to_param, jogo: valid_attributes}, session: valid_session
     expect(jogo2.titulo).to eq(titul)
  end
  end


  describe "buscar jogo" do
  it "buscar jogo" do
     jogo1 = Jogo.create valid_attributes
     jogo2 = Jogo.create valid_attributes
     post :buscar_nome, params: {titulo: "mario"}, session: valid_session
     expect(response).to be_success
  end
  end


  describe "GET #index" do
    it "returns a success response" do
      jogo = Jogo.create valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      jogo = Jogo.create! valid_attributes
      get :show, params: {id: jogo.to_param}, session: valid_session
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
      jogo = Jogo.create! valid_attributes
      get :edit, params: {id: jogo.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Jogo" do
        expect {
          post :create, params: {jogo: valid_attributes}, session: valid_session
        }.to change(Jogo, :count).by(1)
      end

      it "redirects to the created jogo" do
        post :create, params: {jogo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Jogo.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {jogo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
           titulo:"CHICO NA ROCA",
	   imagem_url:"https://scontent-sea1-1.cdninstagram.com/t51.2885-15/e35/12224269_990504804342823_136709678_n.jpg?ig_cache_key=MTEyMzUyMzE2MjAxMTk1MDcwMw%3D%3D.2",
           descricao:"DFADADSSD",
        }
      }

      it "updates the requested jogo" do
        jogo = Jogo.create! valid_attributes
        put :update, params: {id: jogo.to_param, jogo: new_attributes}, session: valid_session
        jogo.reload
        expect(response).to redirect_to(jogo)
      end

      it "redirects to the jogo" do
        jogo = Jogo.create! valid_attributes
        put :update, params: {id: jogo.to_param, jogo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(jogo)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        jogo = Jogo.create! valid_attributes
        put :update, params: {id: jogo.to_param, jogo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested jogo" do
      jogo = Jogo.create! valid_attributes
      expect {
        delete :destroy, params: {id: jogo.to_param}, session: valid_session
      }.to change(Jogo, :count).by(-1)
    end

    it "redirects to the jogos list" do
      jogo = Jogo.create! valid_attributes
      delete :destroy, params: {id: jogo.to_param}, session: valid_session
      expect(response).to redirect_to(jogos_url)
    end
  end

end
