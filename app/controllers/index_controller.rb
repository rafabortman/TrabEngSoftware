class IndexController < ApplicationController
  def home
  @jogadas = Jogada.order('data DESC').limit(10)
  @jogada = Jogada.new
  @jogos = Jogo.all
  @hackrom = Hackrom.all
  end
end
