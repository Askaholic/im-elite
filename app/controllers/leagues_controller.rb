class LeaguesController < ApplicationController
  def index
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @leagues = @season.leagues
  end

  def show
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:id])
  end

  def new
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = League.new
  end

  def edit
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:id])
  end

  def create
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.create(league_params)

    redirect_to organization_season_leagues_path
  end

  def update
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:id])

    if @league.update(league_params)
      redirect_to organization_season_leagues_path
    else
      render 'edit'
    end
  end

  def destroy
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:id])
    @league.destroy

    redirect_to organization_season_leagues_path
  end

  private
  def league_params
    params.require(:league).permit(:sport, :l_type)
  end
end
