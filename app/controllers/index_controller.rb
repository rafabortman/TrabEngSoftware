class IndexController < ApplicationController
  def home
  @jogadas = Jogada.order('data ASC').limit(10)
  end
end
