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

  # DELETE /comentarios
  def destroy
    Comentario.find_by(id:params[:id]).delete
    render json:{status:true}
  end
end
