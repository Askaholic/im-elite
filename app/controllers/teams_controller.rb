class TeamsController < ApplicationController
  def index
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @teams = @league.teams
  end

  def show
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @team = @league.teams.find(params[:id])
  end

  def new
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @team = Team.new
  end

  def edit
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @team = @league.teams.find(params[:id])
  end

  def create
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @team = @league.teams.create(team_params)

    if @team.save
      redirect_to organization_season_league_teams_path
    else
      render 'new'
    end
  end

  def update
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @team = @league.teams.find(params[:id])

    players = params[:players]
    players.each do |id|
      player = @org.players.find(id)
      if player.team_id != @team.id and player.team != nil
        next
      end

      player.update(team_id: players[id][:id] == '1' ? @team.id : nil)
      puts "Player: " + players[id][:id]
    end

    if @team.update(team_params)
      redirect_to [@org, @season, @league, @team]
    else
      render 'edit'
    end
  end

  def destroy
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @team = @league.teams.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
