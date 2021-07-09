class CampgroundCampsitesController < ApplicationController
  def index
    @campground = Campground.find(params[:id])
    @campsites = @campground.campsites
  end
end
