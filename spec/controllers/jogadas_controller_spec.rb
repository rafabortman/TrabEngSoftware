require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe JogadasController, type: :controller do
  Usuario.create({
    nome:"Usuario Teste Jogadas Rspec",
    email:"test@gmail.com",
    username:"tsttst",
    senha:"tester",
    nacionalidade:"br",
    confirmar_senha:"tester",
    imagem_perfil:"asdsd"
  });
  Jogo.create({
      titulo:"Jogo Teste Jogadas Rspec",
      imagem_url:"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd",
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

   let(:valid_attributes_nomes) {
    {
      texto_post:"Mario Bros",
      plataforma:"PC",
      data:"Side scroller classico",
      tempo_horas:1,
      tempo_minutos:10,
      tempo_segundos:37,
      categoria:"Classico",
      link:"https://www.youtube.com/embed/fEaTMekrcz0",
      usuario_id:"tsttst",
      jogo_id:"Jogo Teste Jogadas Rspec"
    }

  }

  let(:invalid_attributes) {
    {
      texto_post:"Mario Bros",
      plataforma:"PC",
      data:"Side scroller classico",
      tempo_horas:1,
      tempo_minutos:10,
      tempo_segundos:37,
      categoria:"Classico",
      link:"",
      usuario_id: Usuario.find_by(nome: "Usuario Teste Jogadas Rspec").id,
      jogo_id: Jogo.find_by(titulo: "Jogo Teste Jogadas Rspec").id
    }  
  }


  describe "GET #index" do
    it "returns a success response" do
      Jogada.new(valid_attributes)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      jogada = Jogada.create! valid_attributes
      get :show, params: {id: jogada.to_param}
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
      jogada = Jogada.create! valid_attributes
      get :edit, params: {id: jogada.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Jogada" do
	      jogada = Jogada.create! valid_attributes
        expect {
          post :create, params: {jogada: valid_attributes_nomes}
        }.to change(Jogada, :count).by(1)
      end

      it "redirects to the created jogada" do
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).to redirect_to(Jogada.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {jogada: invalid_attributes}
        expect(response).not_to be_success
      end

      it "criar com tempo negativo" do
        valid_attributes[:tempo_horas] = -1
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
        valid_attributes[:tempo_horas] = 2
        valid_attributes[:tempo_minutos] = -1
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
        valid_attributes[:tempo_minutos] = 2
        valid_attributes[:tempo_segundos] = -1
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
      end

      it "criar com campos de tempo maiores do que deviam" do 
        valid_attributes[:tempo_minutos] = 60
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
        valid_attributes[:tempo_minutos] = 2
        valid_attributes[:tempo_segundos] = 60
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
      end

      it "criar com titulo e id do jogo invalido" do
        valid_attributes[:jogo_id] = "QEJHOASDHLHAEWQWEJD"
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
      end

      it "criar com username e id do usuario invalido" do 
        valid_attributes[:usuario_id] = "QEJHOASDHLHAEWQWEJD"
        post :create, params: {jogada: valid_attributes_nomes}
        expect(response).not_to be_success
      end


    end
  end

  describe "PUT #update" do
     let(:new_attributes) {
        {
          texto_post:"Mario Bros",
          plataforma:"PS4",
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
    context "with valid params" do
      it "updates the requested jogada" do
        jogada = Jogada.create! valid_attributes
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        jogada.reload
        expect(Jogada.find_by(id:jogada.id).plataforma).to eq("PS4")
      end

      it "redirects to the jogada" do
        jogada = Jogada.create! valid_attributes
        put :update, params: {id: jogada.to_param, jogada: valid_attributes_nomes}
        expect(response).to redirect_to(jogada)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        jogada = Jogada.create! valid_attributes
        put :update, params: {id: jogada.to_param, jogada: invalid_attributes}
        expect(response).to be_success
      end

      it "atualizar com tempo negativo" do
        jogada = Jogada.create! valid_attributes
        new_attributes[:tempo_horas] = -1
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
        new_attributes[:tempo_horas] = 2
        new_attributes[:tempo_minutos] = -1
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
        new_attributes[:tempo_minutos] = 2
        new_attributes[:tempo_segundos] = -1
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
      end

      it "atualizar com campos de tempo maiores do que deviam" do 
        jogada = Jogada.create! valid_attributes
        new_attributes[:tempo_minutos] = 60
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
        new_attributes[:tempo_minutos] = 2
        new_attributes[:tempo_segundos] = 60
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
      end

      it "atualizar com titulo e id do jogo invalido" do
        jogada = Jogada.create! valid_attributes   
        new_attributes[:jogo_id] = "QEJHOASDHLHAEWQWEJD"
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
      end

      it "atualizar com username e id do usuario invalido" do 
        jogada = Jogada.create! valid_attributes
        new_attributes[:usuario_id] = "QEJHOASDHLHAEWQWEJD"
        put :update, params: {id: jogada.to_param, jogada: new_attributes}
        expect(response).to be_success
      end


    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested jogada" do
      jogada = Jogada.create! valid_attributes
      expect {
        delete :destroy, params: {id: jogada.to_param}
      }.to change(Jogada, :count).by(-1)
    end

    it "redirects to the jogadas list" do
      jogada = Jogada.create! valid_attributes
      delete :destroy, params: {id: jogada.to_param}
      expect(response).to redirect_to(jogadas_url)
    end
  end

  describe "adicionar pelo jogo" do 
    it "parametros validos" do
       expect {
          post :add_pelo_jogo, params: {jogada: valid_attributes_nomes}
        }.to change(Jogada, :count).by(1)
    end

    it "parametros invalidos" do
      expect {
          post :add_pelo_jogo, params: {jogada: invalid_attributes}
        }.to change(Jogada, :count).by(0)
    end
  end



end
