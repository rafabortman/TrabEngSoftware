class PontosController < ApplicationController
  # POST /pontos
  def create
    @ponto = Ponto.new(jogada_id:params[:jogada_id],nota:params[:nota])
    if @ponto.save
      render json:{status:true}
    else
      puts "<<<<<<<<<ERRO>>>>>>>>>"
      err = @ponto.errors.full_messages
      puts err
      render json:{status:false}
    end
  end
end
