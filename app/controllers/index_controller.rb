class IndexController < ApplicationController
  def home
   @jogadas = Jogada.order('data DESC').limit(10)
  end
end
