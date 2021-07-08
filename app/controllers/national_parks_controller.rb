class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.order_by_most_recent
  end

  def show
    @national_park = NationalPark.find(params[:id])
  end
end
