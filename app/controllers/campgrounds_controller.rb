class CampgroundsController < ApplicationController
  def index
    @campgrounds = Campground.order_by_recently_created
  end

  def show
    @campground = Campground.find(params[:id])
  end

  def new
  end

  def create
    campground = Campground.create(campground_params)
    redirect_to '/campgrounds'
  end

  def edit
    @campground = Campground.find(params[:id])
  end

  def update
    campground = Campground.find(params[:id])
    campground.update(campground_params)
    redirect_to "/campgrounds/#{campground.id}"
  end

  def destroy
    Campground.destroy(params[:id])
    redirect_to '/campgrounds'
  end

private
  def campground_params
    params.permit(:name, :reservation_allowed, :max_nights)
  end
end
