class GamestatsController < ApplicationController
  before_action :set_gamestat, only: [:show, :edit, :update, :destroy]

  # GET /gamestats
  # GET /gamestats.json
  def index
    @gamestats = Gamestat.all
  end

  # GET /gamestats/1
  # GET /gamestats/1.json
  def show
  end

  # GET /gamestats/new
  def new
    @gamestat = Gamestat.new
  end

  # GET /gamestats/1/edit
  def edit
  end

  # POST /gamestats
  # POST /gamestats.json
  def create
    @gamestat = Gamestat.new(gamestat_params)

    respond_to do |format|
      if @gamestat.save
        format.html { redirect_to @gamestat, notice: 'Gamestat was successfully created.' }
        format.json { render :show, status: :created, location: @gamestat }
      else
        format.html { render :new }
        format.json { render json: @gamestat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamestats/1
  # PATCH/PUT /gamestats/1.json
  def update
    respond_to do |format|
      if @gamestat.update(gamestat_params)
        format.html { redirect_to @gamestat, notice: 'Gamestat was successfully updated.' }
        format.json { render :show, status: :ok, location: @gamestat }
      else
        format.html { render :edit }
        format.json { render json: @gamestat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamestats/1
  # DELETE /gamestats/1.json
  def destroy
    @gamestat.destroy
    respond_to do |format|
      format.html { redirect_to gamestats_url, notice: 'Gamestat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamestat
      @gamestat = Gamestat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gamestat_params
      params.require(:gamestat).permit(:player_id, :team_id, :match_id, :minutos, :puntos, :t2, :t2a, :t3, :t3a, :t1, :t1a, :rebotes, :rebotesoff, :assistencias, :robos, :tapones, :perdidas, :faltas, :faltasrecibidas, :valoracion)
    end
end
