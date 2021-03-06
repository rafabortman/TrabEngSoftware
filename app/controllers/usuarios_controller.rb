class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params.except(:imagem_upload))
    @usuario.definir_imagem_perfil(usuario_params[:imagem_upload],0)
    @checkUsername = Usuario.find_by(username:usuario_params[:username])
    if(@checkUsername.blank?)
      respond_to do |format|
        if @usuario.save
          log_in @usuario
          ContatoMailer.contato_email(@usuario).deliver   
          format.html { redirect_to @usuario, notice: 'Usuario criado com sucesso' }
          format.json { render :show, status: :created, location: @usuario }
        else
          format.html { render :new }     
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "================== ERRO: O NOME DE USUARIO ESCOLHIDO JA EXISTE  ==================  "
      redirect_to "/usuarios/new"
    end

    
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario.definir_imagem_perfil(usuario_params[:imagem_upload],1)
    respond_to do |format|
      if @usuario.update(usuario_params.except(:imagem_upload))
        format.html { redirect_to @usuario, notice: 'Usuario atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario excluido com sucesso' }
      format.json { head :no_content }
    end
  end

  # GET /buscar
  def buscar
  end

  # POST /buscar/mostrarResultados
  def mostrarResultados
    @usuarios = Usuario.where(["username LIKE ?", "%#{params[:username]}%"])
    respond_to do |format|
        format.html
        format.json {    render json: @usuarios   }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :nacionalidade, :email, :username, :senha, :confirmar_senha, :imagem_upload)
    end
end
