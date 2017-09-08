require 'test_helper'

class JogadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jogada = jogadas(:one)
  end

  test "should get index" do
    get jogadas_url
    assert_response :success
  end

  test "should get new" do
    get new_jogada_url
    assert_response :success
  end

  test "should create jogada" do
    assert_difference('Jogada.count') do
      post jogadas_url, params: { jogada: { data: @jogada.data, jogador: @jogada.jogador, jogo: @jogada.jogo, link: @jogada.link, plataforma: @jogada.plataforma } }
    end

    assert_redirected_to jogada_url(Jogada.last)
  end

  test "should show jogada" do
    get jogada_url(@jogada)
    assert_response :success
  end

  test "should get edit" do
    get edit_jogada_url(@jogada)
    assert_response :success
  end

  test "should update jogada" do
    patch jogada_url(@jogada), params: { jogada: { data: @jogada.data, jogador: @jogada.jogador, jogo: @jogada.jogo, link: @jogada.link, plataforma: @jogada.plataforma } }
    assert_redirected_to jogada_url(@jogada)
  end

  test "should destroy jogada" do
    assert_difference('Jogada.count', -1) do
      delete jogada_url(@jogada)
    end

    assert_redirected_to jogadas_url
  end
end
