class NationalParkTrailsController < ApplicationController
  def index
    @national_park = NationalPark.find(params[:national_park_id])
    if params[:sort] == "name_asc"
      @trails = @national_park.sort_by_name
    else
      @trails = @national_park.trails
    end
  end
end
