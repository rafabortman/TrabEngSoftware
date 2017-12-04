require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe TorneiosController, type: :controller do

  @jogoTest = Jogo.find_by(titulo:"TestTournament")
  if @jogoTest!=nil
    @jogoTest.destroy
  end
  @jogoTest = Jogo.create!({
    titulo:"TestTournament", 
    imagem_url:"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd", 
    descricao:"AAAA"}
  )

  @usuarioTest = Usuario.find_by(username:"teste_torneio")
  if(@usuarioTest != nil)
    @usuarioTest.destroy
  end
  @usuarioTest = Usuario.create!(
  {
      nome:"TorneioAAA",
      email:"TorneioAAA@gmail.com",
      username:"teste_torneio",
      senha:"TorneioAAA",
      nacionalidade:"HUEHUEBR",
      confirmar_senha:"TorneioAAA",
      imagem_perfil:"dsasd"
  })
  
  let(:valid_attributes) {
    {
      titulo:"TorneioTeste",
      data_inicio:DateTime.now + 10.days,
      data_fim:DateTime.now + 12.days,
      regras:"THERE ARE NO RULES",
      jogo_id:Jogo.find_by(titulo: "TestTournament").id
    } 
  }

  let(:valid_attributes2) {
    {
      titulo:"TorneioTeste2",
      data_inicio:DateTime.now + 10.days,
      data_fim:DateTime.now + 12.days,
      regras:"THERE ARE NO RULES",
      jogo_id:"TestTournament"
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

  let(:invalid_attributes2) {
    {
      titulo:"TorneioTesteFalso2",
      data_inicio:DateTime.now - 10.days,
      data_fim:DateTime.now + 10.days,
      regras:"THERE ARE NO RULES",
      jogo_id:Jogo.find_by(titulo: "TestTournament").id
    }
  }

  let(:invalid_attributes3) {
    {
      titulo:"TorneioTesteFalso3",
      data_inicio:DateTime.now - 10.days,
      data_fim:DateTime.now - 10.minutes,
      regras:"THERE ARE NO RULES",
      jogo_id:Jogo.find_by(titulo: "TestTournament").id
    }
  }

  let(:invalid_attributes4) {
    {
      titulo:"TorneioTesteFalso4",
      data_inicio:DateTime.now + 10.days,
      data_fim:DateTime.now + 20.days,
      regras:"THERE ARE NO RULES",
      jogo_id:-1
    }
  }

  let(:invalid_attributes5) {
    {
      titulo:"TorneioTeste2",
      data_inicio:DateTime.now + 10.days,
      data_fim:DateTime.now + 12.days,
      regras:"THERE ARE NO RULES",
      jogo_id:"ASDJOASDHJOPQWHEHADQWUOPERHUIOQWEHQWD"
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

  describe "GET #add_jogada" do
    it "retornar pagina de adicao de jogadas para tal torneio" do
      torneio = Torneio.create! valid_attributes
      get :jogada, params: {id: torneio.to_param}
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

      it "criar enviando nome do jogo ao inves do id" do
        expect {
          post :create, params: { torneio: valid_attributes2}
        }.to change(Torneio,:count).by(1)
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

      it "criar com campo regras vazio" do
        valid_attributes[:regras] = ""
        expect {
          post :create, params: {torneio: valid_attributes}
        }.to change(Torneio,:count).by(0)
      end

      it "criar com campo titulo vazio" do
        valid_attributes[:titulo] = ""
        expect {
          post :create, params: {torneio: valid_attributes}
        }.to change(Torneio,:count).by(0)
      end

      it "criar enviando nome do jogo invalidp ao inves do id" do
        expect {
          post :create, params: {torneio: invalid_attributes5}
        }.to change(Torneio,:count).by(0)
      end

      it "criar com inicio anterior a data atual" do
        expect {
          post :create, params: {torneio: invalid_attributes2}
          }.to change(Torneio,:count).by(0)
      end

      it "criar com data de fim anterior a data atual" do
        expect {
          post :create, params: {torneio: invalid_attributes3}
          }.to change(Torneio,:count).by(0)
      end

      it "criar com id de jogo invalido" do 
        expect {
          post :create, params: {torneio: invalid_attributes4}
          }.to change(Torneio,:count).by(0)
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

      it "atualizar enviando nome do jogo ao inves do id" do
        torneio = Torneio.create! valid_attributes
        new_attributes[:jogo_id] = "TestTournament"
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

      it "atualizar com campo regras vazio" do
        torneio = Torneio.create! valid_attributes
        valid_attributes[:regras] = ""
        expect {
          put :update, params: {id: torneio.to_param,torneio: valid_attributes}
        }.to change(Torneio,:count).by(0)
      end

      it "atualizar com campo titulo vazio" do
        torneio = Torneio.create! valid_attributes
        valid_attributes[:titulo] = ""
        put :update, params: {id: torneio.to_param,torneio: valid_attributes}
        expect(response).to be_success
      end

      it "atualizar enviando nome do jogo invalido ao inves do id" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param,torneio: invalid_attributes5}
        expect(response).to be_success
      end

      it "atualizar com inicio anterior a data atual" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param,torneio: invalid_attributes2}
        expect(response).to be_success
      end

      it "atualizar com data de fim anterior a data atual" do
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param,torneio: invalid_attributes3}
        expect(response).to be_success
      end

      it "atualizar com id de jogo invalido" do 
        torneio = Torneio.create! valid_attributes
        put :update, params: {id: torneio.to_param,torneio: invalid_attributes4}
        expect(response).to be_success
      end


    end
  end

  describe "DELETE #destroy" do
    let(:new_attributes) {  
        {
          titulo:"TorneioTeste",
          data_inicio:DateTime.now - 15.days,
          data_fim:DateTime.now + 17.days,
          regras:"THERE ARE SOME RULES",
          jogo_id:Jogo.find_by(titulo: "TestTournament").id
        } 
    }

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

    it "destruir torneio destroi tambem as jogadas" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(JogadaTorneio.count).to eq(1)
        expect(@usuario.jogada_torneios.count).to eq(1)
        @torneio.destroy
        expect(@usuario.jogada_torneios.count).to eq(0)
        expect(JogadaTorneio.count).to eq(0)
    end

    it "destruir torneio faz usuario perder a referencia ao torneio" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@usuario.torneios.count).to eq(1)
        @torneio.destroy
        expect(@usuario.torneios.count).to eq(0)
    end

    it "destruir usuario retira a jogada dele" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        @usuario.destroy
        expect(@torneio.jogada_torneios.count).to eq(0)
        expect(JogadaTorneio.count).to eq(0)
    end

    it "destruir jogo destroi o torneio e as jogadas" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        @jogo = @torneio.jogo
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        @jogo.destroy
        expect(Torneio.count).to eq(0)
        expect(JogadaTorneio.count).to eq(0)
        expect(@usuario.torneios.count).to eq(0)
        expect(@usuario.jogada_torneios.count).to eq(0)
    end


  end

  describe "Adicao de jogadas" do


    let(:new_attributes) {  
        {
          titulo:"TorneioTeste",
          data_inicio:DateTime.now - 15.days,
          data_fim:DateTime.now + 17.days,
          regras:"THERE ARE SOME RULES",
          jogo_id:Jogo.find_by(titulo: "TestTournament").id
        } 
    }
    #user.save(:validate => false)
    it "com tudo certinho" do
      expect {
        Torneio.new(new_attributes).save(validate: false) #evita as validacoes que iriam impedir o torneio de ser criado com data de inicio anterior a atual
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        expect(Torneio.count).to eq(1)
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(1)
        expect(@usuario.torneios.count).to eq(1)
        expect(@usuario.jogada_torneios.count).to eq(1)
      }.to change(JogadaTorneio,:count).by(1)
    end

    it "usuario deletado apos enviar" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(1)
        expect(JogadaTorneio.count).to eq(1)
        @usuario.destroy
        expect(@torneio.jogada_torneios.count).to eq(0)
        expect(JogadaTorneio.count).to eq(0)
    end

    it "link invalido" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube10.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(0)
        expect(JogadaTorneio.count).to eq(0)
    end

    it "usuario enviar mais de uma jogada" do
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(1)
        expect(@usuario.torneios.count).to eq(1)
        expect(@usuario.jogada_torneios.count).to eq(1)
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(1)
        expect(@usuario.torneios.count).to eq(1)
        expect(@usuario.jogada_torneios.count).to eq(1)
    end

    it "antes do torneio comecar" do
        new_attributes[:data_inicio] = DateTime.now + 10.days
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(0)
        expect(@usuario.torneios.count).to eq(0)
        expect(@usuario.jogada_torneios.count).to eq(0)
    end

    it "depois do torneio terminar" do
        new_attributes[:data_fim] = DateTime.now - 10.minutes
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(0)
        expect(@usuario.torneios.count).to eq(0)
        expect(@usuario.jogada_torneios.count).to eq(0)
    end

    it "mesmo usuario, 2 torneios" do
        Torneio.new(new_attributes).save(validate: false)
        new_attributes[:titulo] = "novo titulo"
        Torneio.new(new_attributes).save(validate: false)
        @torneio1 = Torneio.find_by(titulo:"TorneioTeste")
        @torneio2 = Torneio.find_by(titulo:"novo titulo")
        @usuario = Usuario.find_by(username:"teste_torneio")
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio1.id}}
        post :add_jogada, params: {post: {usuario_id:@usuario.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio2.id}}
        expect(@torneio1.jogada_torneios.count).to eq(1)
        expect(@torneio2.jogada_torneios.count).to eq(1)
        expect(@usuario.torneios.count).to eq(2)
        expect(@usuario.jogada_torneios.count).to eq(2)
        expect(JogadaTorneio.count).to eq(2)
    end

    it "2 usuarios, mesmo torneio" do
        Usuario.create!({nome:"TorneioBBB",email:"TorneioBBB@gmail.com",username:"teste_torneio2",senha:"Torneio",nacionalidade:"HAHAHA",confirmar_senha:"Torneio",imagem_perfil:"dsaedsd"})
        Torneio.new(new_attributes).save(validate: false)
        @torneio = Torneio.find_by(titulo:"TorneioTeste")
        @usuario1 = Usuario.find_by(username:"teste_torneio")
        @usuario2 = Usuario.find_by(username:"teste_torneio2")
        post :add_jogada, params: {post: {usuario_id:@usuario1.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        post :add_jogada, params: {post: {usuario_id:@usuario2.id,link:"https://www.youtube.com/embed/sPNQ5AKRHyY",torneio_id:@torneio.id}}
        expect(@torneio.jogada_torneios.count).to eq(2)
        expect(@usuario1.torneios.count).to eq(1)
        expect(@usuario1.jogada_torneios.count).to eq(1)
        expect(@usuario2.torneios.count).to eq(1)
        expect(@usuario2.jogada_torneios.count).to eq(1)
        expect(JogadaTorneio.count).to eq(2)
    end


  end



end
