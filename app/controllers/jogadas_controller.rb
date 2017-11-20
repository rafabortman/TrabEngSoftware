class JogadasController < ApplicationController
  before_action :set_jogada, only: [:show, :edit, :update, :destroy]
  

  # GET /jogadas
  # GET /jogadas.json
  def index
    @jogadas = Jogada.order('milissegundos')
    @jogos = Jogo.all
    @hackroms = Hackrom.all
  end

  # GET /jogadas/1
  # GET /jogadas/1.json
  def show
    idJogada = @jogada.id
    @comentarios = Comentario.where(["jogada_id = ?", idJogada])
    @pontos =  Ponto.where(["jogada_id = ?", idJogada])
    
    @media = 0
    if !(@pontos.blank?)
      sum = 0
      @pontos.each do |p|
        sum = sum + p.nota
      end
  
      @media = sum/@pontos.length
    end

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
      if @jogada.salvar(jogada_params)
        
	format.html { redirect_to @jogada, notice: 'Jogada was successfully created.' }
        format.json { render :show, status: :created, location: @jogada }
      else
        format.html { redirect_to home_path(id: @jogada.jogo_id), flash: { error: @jogada.errors.full_messages.join(', ')}}
        format.json { render json: @jogada.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /createJogadaPeloJogo
  def add_pelo_jogo

      @jogada = Jogada.new(jogada_params)
      respond_to do |format|
      if @jogada.salvar(jogada_params)
        format.html { redirect_to @jogada, notice: 'Jogada was successfully created.' }
 	format.json { head :no_content }
      else  
        format.html { redirect_to jogoAddJogada_path(id: @jogada.jogo_id), flash: { error: @jogada.errors.full_messages.join(', ')}}
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
  
  #GET /shared
  def shared
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jogada
      @jogada = Jogada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # 1 segundo = 1000 millisegundos, 1 minuto = 60.000, 1 hora = 3.600.000 milissegundos
    def jogada_params
      params.require(:jogada).permit(:texto_post, :plataforma, :data,:tempo_horas, :tempo_minutos, :tempo_segundos ,:milissegundos, :categoria, :link, :usuario_id, :jogo_id, :hackrom_id)
    end
end
