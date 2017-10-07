class JogosController < ApplicationController
  before_action :set_jogo, only: [:show, :edit, :update, :destroy]

  # GET /jogos
  # GET /jogos.json
  def index
    @jogos = Jogo.all
  end

  # GET /jogos/1
  # GET /jogos/1.json
  def show
  end

  # GET /jogos/new
  def new
    @jogo = Jogo.new
    @generos = Genero.all
  end

  # GET /jogos/1/edit
  def edit
    @generos = Genero.all
  end

  # POST /jogos
  # POST /jogos.json
  def create
    @jogo = Jogo.new(jogo_params)
    generos = params[:genero_ids]
    respond_to do |format|
      if @jogo.salvar (generos)
        format.html { redirect_to @jogo, notice: 'Jogo foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @jogo }
      else
        format.html { render :new }
	@generos = Genero.all
        format.json { render json: @jogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jogos/1
  # PATCH/PUT /jogos/1.json
  def update
    generos = params[:genero_ids]
    respond_to do |format|
      if @jogo.atualizar(jogo_params,generos)
        format.html { redirect_to @jogo, notice: 'Jogo foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @jogo }
      else
        format.html { render :edit }
	@generos = Genero.all
        format.json { render json: @jogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jogos/1
  # DELETE /jogos/1.json
  def destroy
    @jogo.destroy
    respond_to do |format|
      format.html { redirect_to jogos_url, notice: 'Jogo foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end


  # POST /buscar_nome
  def buscar_nome
	@jogos = Jogo.where(["titulo LIKE ?", "%#{params[:titulo]}%"])
	respond_to do |format|
        format.html
        format.json {    render json: @jogos   }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jogo
      @jogo = Jogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jogo_params
      params.require(:jogo).permit(:titulo, :imagem_url, :descricao)
    end
end
