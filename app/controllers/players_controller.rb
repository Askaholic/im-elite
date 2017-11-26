class PlayersController < ApplicationController

  def index
    @org = Organization.find(params[:organization_id])
    @players = @org.players
  end

  def show
    @org = Organization.find(params[:organization_id])
    @player = Player.find(params[:id])
  end

  def new
    @org = Organization.find(params[:organization_id])
    @player = Player.new
  end

  def edit
    @org = Organization.find(params[:organization_id])
    @player = Player.find(params[:id])
  end

  def create
    @org = Organization.find(params[:organization_id])
    @player = @org.players.create(player_params)

    redirect_to organization_players_path
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to organization_players_path
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to organization_players_path
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :team_id)
  end
end
