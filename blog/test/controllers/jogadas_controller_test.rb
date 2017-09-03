require 'test_helper'

class JogadasControllerTest < ActionController::TestCase
  setup do
    @jogada = jogadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jogadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jogada" do
    assert_difference('Jogada.count') do
      post :create, jogada: { data: @jogada.data, jogador: @jogada.jogador, jogo: @jogada.jogo, link: @jogada.link, plataforma: @jogada.plataforma }
    end

    assert_redirected_to jogada_path(assigns(:jogada))
  end

  test "should show jogada" do
    get :show, id: @jogada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jogada
    assert_response :success
  end

  test "should update jogada" do
    patch :update, id: @jogada, jogada: { data: @jogada.data, jogador: @jogada.jogador, jogo: @jogada.jogo, link: @jogada.link, plataforma: @jogada.plataforma }
    assert_redirected_to jogada_path(assigns(:jogada))
  end

  test "should destroy jogada" do
    assert_difference('Jogada.count', -1) do
      delete :destroy, id: @jogada
    end

    assert_redirected_to jogadas_path
  end
end
