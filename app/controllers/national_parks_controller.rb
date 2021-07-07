class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.all
  end

  def show
    @national_park = NationalPark.find(params[:id])
  end

  def show_trails
    @national_park = NationalPark.find(params[:id])
    @trails = @national_park.trails
  end
end
