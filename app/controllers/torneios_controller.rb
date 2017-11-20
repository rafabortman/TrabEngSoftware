class TorneiosController < ApplicationController
  before_action :set_torneio, only: [:show, :edit, :update, :destroy]

  # GET /torneios
  # GET /torneios.json
  def index
    @torneios = Torneio.all.order("data_inicio")
  end

  # GET /torneios/1
  # GET /torneios/1.json
  def show
  end

  # GET /torneios/new
  def new
    @torneio = Torneio.new
  end

  # GET /torneios/1/edit
  def edit
  end

  # POST /torneios
  # POST /torneios.json
  def create
    @torneio = Torneio.new(torneio_params)
    respond_to do |format|
      if @torneio.salvar(torneio_params)
        format.html { redirect_to @torneio, notice: 'Torneio was successfully created.' }
        format.json { render :show, status: :created, location: @torneio }
      else
        format.html { render :new }
        format.json { render json: @torneio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /torneios/1
  # PATCH/PUT /torneios/1.json
  def update
    jogo = Jogo.find_by(titulo: torneio_params[:jogo_id])
    if jogo
      torneio_params[:jogo_id] = jogo.id
    end
    respond_to do |format|
      if @torneio.atualizar(torneio_params)
        format.html { redirect_to @torneio, notice: 'Torneio was successfully updated.' }
        format.json { render :show, status: :ok, location: @torneio }
      else
        format.html { render :edit }
        format.json { render json: @torneio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /torneios/1
  # DELETE /torneios/1.json
  def destroy
    @torneio.destroy
    respond_to do |format|
      format.html { redirect_to torneios_url, notice: 'Torneio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET /jogada_torneio/

  def jogada
    if(!@torneio)
      @torneio = set_torneio
    end
    @jogada = JogadaTorneio.new
  end

  #POST /torneioAddJogada
  def add_jogada
    @torneio = Torneio.find(jogada_params[:torneio_id])
    @jogada = JogadaTorneio.new(jogada_params)
    respond_to do |format|
      if @jogada.save
        format.html { redirect_to @torneio, notice: 'Sua jogada foi adicionada.' }
        #format.json { render :show, status: :created, location: @torneio }
      else
        format.html { redirect_to jogada_torneio_path(@torneio), flash: { error: @jogada.errors.full_messages.join(', ')} }
        format.json { render json: @jogada.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torneio
      @torneio = Torneio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def torneio_params
      params.require(:torneio).permit(:titulo, :data_inicio, :data_fim, :regras, :jogo_id)
    end

    def jogada_params
      params.require(:post).permit(:usuario_id,:link,:torneio_id)
    end
end
