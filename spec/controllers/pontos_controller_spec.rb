require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe PontosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Ponto. As you add validations to Ponto, be sure to
  # adjust the attributes here as well.
  

  @userTest=Usuario.find_by( email:"testUserforpontos@test.com" )
  if @userTest!=nil
    @userTest.destroy
  end
  Usuario.create!(
    nome:"TestUserPontos",
    email:"testUserforpontos@test.com",
    username:"TestUserPontos",
    senha:"pswd",
    nacionalidade:"BR",
    confirmar_senha:"pswd",
    imagem_perfil:"asdasd"
  )
  

  @jogoTest= Jogo.find_by(titulo:"TestPontos")
  if @jogoTest!=nil
    @jogoTest.destroy
  end
  Jogo.create!({
    titulo:"TestPontos", 
    imagem_url:"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd", 
    descricao:"AAAA"}
  )


  jogada = Jogada.create!(
    texto_post:"textPost",
    plataforma:"PC",
    data:"22/10/2017",
    tempo_horas:1,
    tempo_minutos:10,
    tempo_segundos:37,
    milissegundos:4,
    categoria:"Classico",
    link:"https://www.youtube.com/embed/fEaTMekrcz0",
    usuario_id: Usuario.find_by(nome: "TestUserPontos").id,
    jogo_id: Jogo.find_by(titulo: "TestPontos").id
  
  )

  let(:valid_attributes) {
    {
      jogada_id:jogada.id,
      nota:3
    }
  }

  let(:invalid_attributes) {
    {
      jogada_id:"1",
      nota:"3"
    }
  }


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Ponto" do
        expect {
          post :create, params: {jogada_id:jogada.id,nota:3}
        }.to change(Ponto, :count).by(1)
      end

    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {ponto: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

end
