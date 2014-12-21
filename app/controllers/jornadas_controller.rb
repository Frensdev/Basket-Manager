class JornadasController < ApplicationController
  before_action :set_jornada, only: [:show, :edit, :update, :destroy]

  # GET /jornadas
  # GET /jornadas.json
  def index
    @jornadas = Jornada.all
  end

  # GET /jornadas/1
  # GET /jornadas/1.json
  def show
    @matches = Match.where(jornada_id: params[:id])
    n = 0
    @partidos = []
      @matches.each do |match|
       @partidos[n] = match.id
       n += 1
      end
    @results = Gamestat.where(match_id: @partidos,player_id: [-1,-2])
    @puntos = Gamestat.where(match_id: @partidos).where.not(player_id: [-1,-2]).limit(10).order("puntos DESC")
    @rebotes = Gamestat.where(match_id: @partidos).where.not(player_id: [-1,-2]).limit(10).order("rebotes DESC")
    @asistencias = Gamestat.where(match_id: @partidos).where.not(player_id: [-1,-2]).limit(10).order("assistencias DESC")
    @robos = Gamestat.where(match_id: @partidos).where.not(player_id: [-1,-2]).limit(10).order("robos DESC")
    @tapones = Gamestat.where(match_id: @partidos).where.not(player_id: [-1,-2]).limit(10).order("tapones DESC")
    @valoracion = Gamestat.where(match_id: @partidos).where.not(player_id: [-1,-2]).limit(10).order("valoracion DESC")
  end

  # GET /jornadas/new
  def new
    @jornada = Jornada.new
  end

  # GET /jornadas/1/edit
  def edit
  end

  # POST /jornadas
  # POST /jornadas.json
  def create
    @jornada = Jornada.new(jornada_params)

    respond_to do |format|
      if @jornada.save
        format.html { redirect_to @jornada, notice: 'Jornada was successfully created.' }
        format.json { render :show, status: :created, location: @jornada }
      else
        format.html { render :new }
        format.json { render json: @jornada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jornadas/1
  # PATCH/PUT /jornadas/1.json
  def update
    respond_to do |format|
      if @jornada.update(jornada_params)
        format.html { redirect_to @jornada, notice: 'Jornada was successfully updated.' }
        format.json { render :show, status: :ok, location: @jornada }
      else
        format.html { render :edit }
        format.json { render json: @jornada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jornadas/1
  # DELETE /jornadas/1.json
  def destroy
    @jornada.destroy
    respond_to do |format|
      format.html { redirect_to jornadas_url, notice: 'Jornada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jornada
      @jornada = Jornada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jornada_params
      params.require(:jornada).permit(:league_id, :season_id, :date)
    end
end
