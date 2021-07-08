class NationalParkTrailsController < ApplicationController
  def index
    @national_park = NationalPark.find(params[:national_park_id])
    @trails = @national_park.trails
  end
end
