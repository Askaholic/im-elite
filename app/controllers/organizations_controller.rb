class OrganizationsController < ApplicationController
  def index
    @orgs = Organization.all
  end

  def show
    @org = Organization.find(params[:id])
  end

  def new
    @org = Organization.new
  end

  def create
    @org = Organization.new(org_params)

    if @org.save
      redirect_to organizations_path
    else
      render 'new'
    end
  end

  private
  def org_params
    params.require(:organization).permit(:name)    
  end
end
