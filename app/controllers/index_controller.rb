class IndexController < ApplicationController
  def home
  @jogadas = Jogada.order('data ASC').limit(10)
  @jogada = Jogada.new
  @jogos = Jogo.all
  end
end
