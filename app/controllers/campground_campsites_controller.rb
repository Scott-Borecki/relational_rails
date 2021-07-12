class CampgroundCampsitesController < ApplicationController
  def index
    @campground = Campground.find(params[:id])
    if params[:sort]
      @campsites = @campground.order_campsites_by_name
    elsif params[:amount]
      @campsites = @campground.overnight_fee_greater_than(params[:amount])
    else
      @campsites = @campground.campsites
    end
  end
end
