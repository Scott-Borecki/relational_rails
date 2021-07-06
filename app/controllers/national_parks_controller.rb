class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.all
  end

  def show
    @national_park = NationalPark.find(params[:id])
  end
end
