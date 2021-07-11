class CampgroundCampsitesController < ApplicationController
  def index
    @campground = Campground.find(params[:id])
    if params[:sort]
      @campsites = @campground.order_campsites_by_name
    else
      @campsites = @campground.campsites
    end
  end
end
