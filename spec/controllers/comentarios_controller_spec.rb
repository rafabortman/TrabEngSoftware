require 'rails_helper'
require 'coveralls'
Coveralls.wear!

RSpec.describe ComentariosController, type: :controller do


  @usertest= Usuario.find_by(email:"testUserforcomments@test.com");

  if @usertest!=nil
    @usertest.destroy
  end
  
  Usuario.create!(
    nome:"testUserforcomments",
    email:"testUserforcomments@test.com",
    username:"testUserforcomments",
    senha:"pswd",
    nacionalidade:"BR",
    confirmar_senha:"pswd",
    imagem_perfil:"asdsd"
  )


  @jogoTest = Jogo.find_by(titulo:"TestComments")
  if @jogoTest!=nil
    @jogoTest.destroy
  end
  Jogo.create!({
    titulo:"TestComments", 
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
    usuario_id: Usuario.find_by(nome: "testUserforcomments").id,
    jogo_id: Jogo.find_by(titulo: "TestComments").id
  
  )


  let(:valid_attributes) {
    {
      jogada_id:jogada.id,
      comentario:"teste"
    }
  }

  describe "POST #create" do
    it "returns http success" do
      expect {
        post :create, params: {jogada_id:jogada.id,comentario:"teste"}
      }.to change(Comentario, :count).by(1)
    end
  end

  describe "POST #destroy" do
    it "returns http success" do
      comentario = Comentario.create! valid_attributes
      expect {
        delete :destroy, params: {id: comentario.id}
      }.to change(Comentario, :count).by(-1)
    end
  end

end
