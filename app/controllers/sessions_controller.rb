class SessionsController < ApplicationController

  def new
  end

  def create
    @usuarios = Usuario.all
    respond_to do |format|
      usuario = @usuarios.find_by(username: params[:session][:username].downcase)
      if usuario
       # Log the usuario in and redirect to the usuario's show page.
       format.html {  redirect_to login_path, notice: 'Usuario logado com sucesso' }
       format.json { }
     else
       format.html {  redirect_to login_path, notice: 'Verifique a combinacao de username e senha e tente novamente' }
       format.json { }
      end
    end
  end

  def destroy
  end
end