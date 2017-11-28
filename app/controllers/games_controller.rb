class GamesController < ApplicationController
  def index
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @games = @league.games
  end

  def show
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @game = @league.games.find(params[:id])
  end

  def new
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @game = Game.new
  end

  def edit
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @game = @league.games.find(params[:id])
  end

  def create
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @game = @league.games.create(game_params)

    if @game.save
      update_team_stats(@game.team_1, @league.games)
      update_team_stats(@game.team_2, @league.games)
      redirect_to [@org, @season, @league, :games]
    else
      render 'new'
    end
  end

  def update
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @game = @league.games.find(params[:id])

    p = game_params
    if p[:team_1_points] > p[:team_2_points]
      p[:team_winner_id] = p[:team_1_id]
    elsif p[:team_2_points] > p[:team_1_points]
      p[:team_winner_id] = p[:team_2_id]
    end
    if @game.update(p)
      update_team_stats(@game.team_1, @league.games)
      update_team_stats(@game.team_2, @league.games)
      redirect_to [@org, @season, @league, @game]
    else
      render 'edit'
    end
  end

  def destroy
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:season_id])
    @league = @season.leagues.find(params[:league_id])
    @game = @league.games.find(params[:id])
    @game.destroy

    redirect_to organization_season_league_games_path
  end

  private
  def game_params
    params.require(:game).permit(:date, :team_1_id, :team_2_id, :team_1_points, :team_2_points)
  end

  def update_team_stats(team, games)
    w, t, l = 0, 0, 0
    games.each do |game|
      this_score = 0
      other_score = 0
      if team.id == game.team_1_id
        this_score = game.team_1_points
      elsif team.id == game.team_2_id
        other_score = game.team_2_points
      else
        next
      end

      if this_score > other_score
        w += 1
      elsif this_score == other_score
        t += 1
      else
        l += 1
      end
    end

    team.update(wins: w, losses: l, ties: t)
  end
end
