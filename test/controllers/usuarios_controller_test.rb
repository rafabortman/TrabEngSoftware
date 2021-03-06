require 'test_helper'


class UsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_url
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post usuarios_url, params: { usuario: { email: "teste@gmail.com", nacionalidade: "PT-BR", nome: "Hardwell", senha: "teste", username: "Marshmello", confirmar_senha: "teste" } }
    end
    assert_redirected_to usuario_url(Usuario.last)
  end

  test "should not create usuario without @ at email" do
    assert_no_difference('Usuario.count') do
      post usuarios_url, params: { usuario: { email: "testegmail.com", nacionalidade: "PT-BR", nome: "Hardwell", senha: "teste", username: "Marshmello", confirmar_senha: "teste" } }
    end
    assert_response :success
  end

  test "should not create usuario with existing email" do
    assert_difference('Usuario.count') do
      post usuarios_url, params: { usuario: { email: "teste@gmail.com", nacionalidade: "PT-BR", nome: "Hardwell", senha: "teste", username: "Marshmello", confirmar_senha: "teste" } }
      post usuarios_url, params: { usuario: { email: "teste@gmail.com", nacionalidade: "EN-US", nome: "Borgeous", senha: "teste", username: "Banana", confirmar_senha: "teste" } }
    end
    assert_response :success
  end

  test "should show usuario" do
    get usuario_url(@usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_usuario_url(@usuario)
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: { usuario: { email: "teste@gmail.com", nacionalidade: "PT-BR", nome: "Hardwell", senha: "teste", username: "Marshmello", confirmar_senha: "teste" } }
    assert_redirected_to usuario_url(@usuario)
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete usuario_url(@usuario)
    end

    assert_redirected_to usuarios_url
  end

  test "should get buscar" do
    get "/buscar"
    assert_response :success
  end
 
   
  

end
