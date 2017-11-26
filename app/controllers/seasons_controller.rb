class SeasonsController < ApplicationController
  def index
    @org = Organization.find(params[:organization_id])
    @seasons = @org.seasons
  end

  def show
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:id])
  end

  def new
    @org = Organization.find(params[:organization_id])
    @season = Season.new
  end

  def edit
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:id])
  end

  def create
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.create(season_params)

    redirect_to organization_seasons_path
  end

  def update
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:id])

    if @season.update(season_params)
      redirect_to organization_seasons_path
    else
      render 'edit'
    end
  end

  def destroy
    @org = Organization.find(params[:organization_id])
    @season = @org.seasons.find(params[:id])
    @season.destroy

    redirect_to organization_seasons_path
  end

  private
  def season_params
    params.require(:season).permit(:start_date, :end_date)
  end
end
