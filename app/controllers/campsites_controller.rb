class CampsitesController < ApplicationController
  def index
    @campsites = Campsite.all
  end

  def show
    @campsite = Campsite.find(params[:id])
  end

  def new
    @campground = Campground.find(params[:id])
  end

  def create
    @campground = Campground.find(params[:id])
    campsite = @campground.campsites.create(campsite_params)
    redirect_to "/campgrounds/#{@campground.id}/campsites"
  end

  def campsite_params
    params.permit(:name, :tent_only, :overnight_fee)
  end
end
