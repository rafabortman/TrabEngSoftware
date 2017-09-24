require 'test_helper'

class JogosControllerTest < ActionDispatch::IntegrationTest
	#algumas urls de imagens para os testes
	#http://www.mobygames.com/images/covers/l/6126-super-mario-64-nintendo-64-front-cover.jpg
	#https://images-na.ssl-images-amazon.com/images/I/51kJF0ZKhqL._CR7,0,485,485_UX128.jpg

  setup do
    @jogo = jogos(:one)
  end

  test "should get index" do
    get jogos_url
    assert_response :success
  end

  test "should get new" do
    get new_jogo_url
    assert_response :success
  end

  test "should create jogo" do
    assert_difference('Jogo.count') do
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: "https://images-na.ssl-images-amazon.com/images/I/51kJF0ZKhqL._CR7,0,485,485_UX128.jpg", titulo: "HELLO" } }
    end

    assert_redirected_to jogo_url(Jogo.last)
  end

  test "should show jogo" do
    get jogo_url(@jogo)
    assert_response :success
  end

  test "should get edit" do
    get edit_jogo_url(@jogo)
    assert_response :success
  end

  test "should update jogo" do
    patch jogo_url(@jogo), params: { jogo: { descricao: "dasd", imagem:"https://images-na.ssl-images-amazon.com/images/I/51kJF0ZKhqL._CR7,0,485,485_UX128.jpg", titulo: "HELLO2" } }
    assert_redirected_to jogo_url(@jogo)
  end

  test "should destroy jogo" do
    assert_difference('Jogo.count', -1) do
      delete jogo_url(@jogo)
    end

    assert_redirected_to jogos_url
  end

  test "nao adicionar jogos invalidos" do
    assert_difference('Jogo.count',0) do
      #titulo vazio
      post jogos_url, params: { jogo: { descricao: "dasd", imagem:"http://www.mobygames.com/images/covers/l/6126-super-mario-64-nintendo-64-front-cover.jpg", titulo: "" } }
      #link nao eh uma imagem
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: @jogo.imagem, titulo: @jogo.titulo } }
      #link de imagem inexistente
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: "QUALQUER COISA PRA INVALIDAR O LINK"+"http://www.mobygames.com/images/covers/l/6126-super-mario-64-nintendo-64-front-cover.jpg", titulo: @jogo.titulo } }
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: @jogo.imagem+".ngg", titulo: @jogo.titulo } }
      #titulo gigantesco
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: "https://images-na.ssl-images-amazon.com/images/I/51kJF0ZKhqL._CR7,0,485,485_UX128.jpg", titulo: "dasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasd" } }
      
    end

  end

  test "nao adicionar titulos repetidos" do
    assert_difference("Jogo.count",1) do
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: "http://www.mobygames.com/images/covers/l/6126-super-mario-64-nintendo-64-front-cover.jpg", titulo: "TESTE" } }
      post jogos_url, params: { jogo: { descricao: "dasd", imagem: "https://images-na.ssl-images-amazon.com/images/I/51kJF0ZKhqL._CR7,0,485,485_UX128.jpg", titulo: "TESTE" } }
     end
   end
	
end
