class CampgroundsController < ApplicationController
  def index
    @campgrounds = Campground.order_by_recently_created
  end

  def show
    @campground = Campground.find(params[:id])
  end

  def index_campsites
    show
    @campsites = Campsite.where(campground_id: Campground.find(params[:id]))
  end

  def new
  end

  def create
    campground = Campground.create(campground_params)
    redirect_to '/campgrounds'
  end

  def campground_params
    params.permit(:name, :reservation_allowed, :max_nights)
  end
end
