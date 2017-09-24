require 'test_helper'


class JogosControllerTest < ActionDispatch::IntegrationTest
	#algumas urls de imagens para os testes
	#http://www.mobygames.com/images/covers/l/6126-super-mario-64-nintendo-64-front-cover.jpg
	#https://images-na.ssl-images-amazon.com/images/I/51kJF0ZKhqL._CR7,0,485,485_UX128.jpg

  setup do
    @jogo1 = jogos(:jogoCerto1)
    @jogo2 = jogos(:jogoCerto2)
    @jogoErrado = jogos(:jogoTodoErrado)
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
      post jogos_url, params: { jogo: { descricao: @jogo1.descricao, imagem: @jogo1.imagem, titulo: @jogo1.titulo+"a" } }
    end

    assert_redirected_to jogo_url(Jogo.last)
  end

  test "should show jogo" do
    get jogo_url(@jogo1)
    assert_response :success
  end

  test "should get edit" do
    get edit_jogo_url(@jogo2)
    assert_response :success
  end

  test "should update jogo" do
    patch jogo_url(@jogo2), params: { jogo: { descricao: "", imagem: @jogo1.imagem, titulo: @jogo2.titulo+"coisas extras" } }
    assert_redirected_to jogo_url(@jogo2)
  end

  test "should destroy jogo" do
    assert_difference('Jogo.count', -1) do
      delete jogo_url(@jogo1)
    end

    assert_redirected_to jogos_url
  end

  test "nao adicionar jogos invalidos" do
    assert_difference('Jogo.count',0) do
      #titulo vazio
      post jogos_url, params: { jogo: { descricao: "dasdasdd", imagem: @jogo1.imagem, titulo: @jogoErrado.titulo } }
      #link nao eh uma imagem
      post jogos_url, params: { jogo: { descricao: "dastthhd", imagem: @jogoErrado.imagem, titulo: @jogo1.titulo } }
      #link de imagem inexistente
      post jogos_url, params: { jogo: { descricao: "", imagem: @jogoErrado.imagem+".png", titulo: @jogo2.titulo+"www" } }
      post jogos_url, params: { jogo: { descricao: "v", imagem: @jogo1.imagem+".ngg", titulo: @jogo1.titulo } }
      #titulo gigantesco
      post jogos_url, params: { jogo: { descricao: "daswesccqq--d", imagem: @jogo2.imagem, titulo: "dasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasd" } }
      
    end

  end

  test "nao adicionar titulos repetidos" do
    assert_difference("Jogo.count",1) do
      post jogos_url, params: { jogo: { descricao: @jogo1.descricao, imagem: @jogo1.imagem, titulo: "TESTE" } }
      post jogos_url, params: { jogo: { descricao: @jogo2.descricao, imagem: @jogo2.imagem, titulo: "TESTE" } }
     end
   end
	
end
