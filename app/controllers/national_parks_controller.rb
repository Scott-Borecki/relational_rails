class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.all
  end

  def show
    @national_park = NationalPark.find(params[:id])
  end

  def show_trails
    @trails = Trail.where(national_park_id: NationalPark.find(params[:id]))
  end
end
