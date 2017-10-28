class IndexController < ApplicationController
  def home
  @jogadas = Jogada.order('created_at desc').limit(10)
  @jogada = Jogada.new
  @jogos = Jogo.all
  end
end
