require 'test_helper'


class JogosGeneroTest < ActionDispatch::IntegrationTest
  setup do
	@jogo1 = jogos(:jogo1)
	@jogo2 = jogos(:jogo2)
	@genero1 = generos(:one)
	@genero2 = generos(:two)
  end

  test "adicionar 1 genero em um jogo" do
    assert_difference(@genero1.jogos.count) do
      patch jogo_url(@jogo1), params: { jogo: { descricao: "", imagem: @jogo1.imagem, titulo: @jogo2.titulo+"coisas extras" }, genero_ids=>[@genero1.id] }
    end

    assert_redirected_to jogo_url(Jogo.last)
  end

end
