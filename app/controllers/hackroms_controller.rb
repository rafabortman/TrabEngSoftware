class HackromsController < ApplicationController
  before_action :set_hackrom, only: [:show, :edit, :update, :destroy]

  # GET /hackroms
  # GET /hackroms.json
  def index
    @hackroms = Hackrom.all
  end

  # GET /hackroms/1
  # GET /hackroms/1.json
  def show
  end

  # GET /hackroms/new
  def new
    @hackrom = Hackrom.new
  end

  # GET /hackroms/1/edit
  def edit
  end

  # POST /hackroms
  # POST /hackroms.json
  def create
    @hackrom = Hackrom.new(hackrom_params)

    respond_to do |format|
      if @hackrom.save
        format.html { redirect_to @hackrom, notice: 'Hackrom was successfully created.' }
        format.json { render :show, status: :created, location: @hackrom }
      else
        format.html { render :new }
        format.json { render json: @hackrom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hackroms/1
  # PATCH/PUT /hackroms/1.json
  def update
    respond_to do |format|
      if @hackrom.update(hackrom_params)
        format.html { redirect_to @hackrom, notice: 'Hackrom was successfully updated.' }
        format.json { render :show, status: :ok, location: @hackrom }
      else
        format.html { render :edit }
        format.json { render json: @hackrom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackroms/1
  # DELETE /hackroms/1.json
  def destroy
    @hackrom.destroy
    respond_to do |format|
      format.html { redirect_to hackroms_url, notice: 'Hackrom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hackrom
      @hackrom = Hackrom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hackrom_params
      params.require(:hackrom).permit(:nomeRom, :jogo_id)
    end
end
