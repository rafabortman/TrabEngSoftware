class JogadasController < ApplicationController
  before_action :set_jogada, only: [:show, :edit, :update, :destroy]
  

  # GET /jogadas
  # GET /jogadas.json
  def index
    @jogadas = Jogada.order('milissegundos')
  end

  # GET /jogadas/1
  # GET /jogadas/1.json
  def show
    idJogada = @jogada.id
    @comentarios = Comentario.where(["jogada_id = ?", idJogada])
  end

  # GET /jogadas/new
  def new
    @jogada = Jogada.new
  end

  # GET /jogadas/1/edit
  def edit
  end

  # POST /jogadas
  # POST /jogadas.json
  def create
    @jogada = Jogada.new(jogada_params)

    respond_to do |format|
      if @jogada.salvar
        format.html { redirect_to @jogada, notice: 'Jogada was successfully created.' }
        format.json { render :show, status: :created, location: @jogada }
      else
        format.html { render :new }
        format.json { render json: @jogada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jogadas/1
  # PATCH/PUT /jogadas/1.json
  def update
    respond_to do |format|
      if @jogada.atualizar(jogada_params)
        format.html { redirect_to @jogada, notice: 'Jogada was successfully updated.' }
        format.json { render :show, status: :ok, location: @jogada }
      else
        format.html { render :edit }
        format.json { render json: @jogada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jogadas/1
  # DELETE /jogadas/1.json
  def destroy
    @jogada.destroy
    respond_to do |format|
      format.html { redirect_to jogadas_url, notice: 'Jogada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #GET /ranking
  def mostrarRanking
    @jogadas = Jogada.group(:categoria).order('tempo_horas,tempo_minutos,tempo_segundos')
  end


  # POST /jogadas/addComment
  def addComment
    @comentario = Jogada.new(jogada_params)

    respond_to do |format|
      if @jogada.save
        format.html { redirect_to @jogada, notice: 'Jogada was successfully created.' }
        format.json { render :show, status: :created, location: @jogada }
      else
        format.html { render :new }
        format.json { render json: @jogada.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jogada
      @jogada = Jogada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # 1 segundo = 1000 millisegundos, 1 minuto = 60.000, 1 hora = 3.600.000 milissegundos
    def jogada_params
      params.require(:jogada).permit(:texto_post, :plataforma, :data,:tempo_horas, :tempo_minutos, :tempo_segundos ,:milissegundos, :categoria, :link, :usuario_id, :jogo_id)
    end
end
