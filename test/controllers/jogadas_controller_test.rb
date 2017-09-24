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

=begin
  test "should create jogada" do
    assert_difference('Jogada.count') do
      post jogadas_url, params: { jogada: { categoria: @jogada.categoria, data: @jogada.data, jogo_id: @jogada.jogo_id, link: @jogada.link, plataforma: @jogada.plataforma, tempo_horas: @jogada.tempo_horas, tempo_minutos: @jogada.tempo_minutos, tempo_segundos: @jogada.tempo_segundos, texto_post: @jogada.texto_post, usuario_id: @jogada.usuario_id } }
    end

    assert_redirected_to jogada_url(Jogada.last)
  end
=end

  test "Falha na criação da jogada" do
    assert_difference('Jogada.count',0) do
      #link sem embed
      post jogadas_url, params: { jogada: { categoria: @jogada.categoria, data: @jogada.data, jogo_id: @jogada.jogo_id, link: 'groselha', plataforma: @jogada.plataforma, tempo_horas: @jogada.tempo_horas, tempo_minutos: @jogada.tempo_minutos, tempo_segundos: @jogada.tempo_segundos, texto_post: @jogada.texto_post, usuario_id: @jogada.usuario_id}}
      #plataforma, jogo e categoria vazios
      post jogadas_url, params: { jogada: { categoria: '', data: @jogada.data, jogo_id: '', link: 'groselha', plataforma: '', tempo_horas: @jogada.tempo_horas, tempo_minutos: @jogada.tempo_minutos, tempo_segundos: @jogada.tempo_segundos, texto_post: @jogada.texto_post, usuario_id: @jogada.usuario_id}}
    end
  end

  test "should show jogada" do
    get jogada_url(@jogada)
    assert_response :success
  end

  test "should get edit" do
    get edit_jogada_url(@jogada)
    assert_response :success
  end
  
=begin

  test "should update jogada" do
    patch jogada_url(@jogada), params: { jogada: { categoria: @jogada.categoria, data: @jogada.data, jogo_id: @jogada.jogo_id, link: @jogada.link, plataforma: @jogada.plataforma, tempo_horas: @jogada.tempo_horas, tempo_minutos: @jogada.tempo_minutos, tempo_segundos: @jogada.tempo_segundos, texto_post: @jogada.texto_post, usuario_id: @jogada.usuario_id } }
    assert_redirected_to jogada_url(@jogada)
  end
=end

  test "should destroy jogada" do
    assert_difference('Jogada.count', -1) do
      delete jogada_url(@jogada)
    end

    assert_redirected_to jogadas_url
  end
end

