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

  def edit
    @campsite = Campsite.find(params[:id])
  end

  def update
    @campsite = Campsite.find(params[:id])
    @campsite.update(campsite_params)
    redirect_to "/campsites/#{@campsite.id}"
  end

  def destroy
    campsites = Campsite.find(params[:id])
    campsites.destroy
    redirect_to '/campsites'
  end

private
  def campsite_params
    params.permit(:name, :tent_only, :overnight_fee)
  end
end
