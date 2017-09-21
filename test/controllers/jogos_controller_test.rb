require 'test_helper'

class JogosControllerTest < ActionDispatch::IntegrationTest
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
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+".png", titulo: @jogo.titulo } }
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
    patch jogo_url(@jogo), params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+".png", titulo: @jogo.titulo } }
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
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+".png", titulo: "" } }
      #link nao eh uma imagem
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem, titulo: @jogo.titulo } }
      #link com formato quase igual ao de uma imagem
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+"png", titulo: "" } }
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+".pngg", titulo: @jogo.titulo } }
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+".ngg", titulo: @jogo.titulo } }
      #titulo gigantesco
      post jogos_url, params: { jogo: { genero: @jogo.genero, imagem: @jogo.imagem+".png", titulo: "dasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasddasdqwasdasdqwdasdqweadwdadasdqweasd" } }
      
    end

  end
	
end
