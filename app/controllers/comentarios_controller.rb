class ComentariosController < ApplicationController
  # POST /comentarios
  def create
    @comentario = Comentario.new(jogada_id:params[:jogada_id],comentario:params[:comentario])
    if @comentario.save
      render json:{status:true}
    else
      err = @comentario.errors.full_messages
      render json:{status:false}
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    Comentario.find(params[:id]).destroy
    render json:{status:true}
  end
end
