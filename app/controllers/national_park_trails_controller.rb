class NationalParkTrailsController < ApplicationController
  def index
    @national_park = NationalPark.find(params[:national_park_id])
    if params[:sort] == "name_asc"
      @trails = @national_park.sort_by_name
    else
      @trails = @national_park.trails
    end
  end

  def new
    @national_park = NationalPark.find(params[:national_park_id])
  end

  def create
    Trail.create(trail_params)
    redirect_to "/national_parks/#{params[:national_park_id]}/trails"
  end

  private

  def trail_params
    params.permit(:name, :length, :is_loop, :national_park_id)
  end
end
