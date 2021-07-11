class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.order_by_most_recent
  end

  def show
    @national_park = NationalPark.find(params[:id])
  end

  def new
  end

  def create
    NationalPark.create(national_park_params)
    redirect_to '/national_parks'
  end

  def edit
    @national_park = NationalPark.find(params[:id])
  end

  def update
    national_park = NationalPark.find(params[:id])
    national_park.update(national_park_params)
    redirect_to "/national_parks/#{national_park.id}"
  end

  private
  
  def national_park_params
    params.permit(:name, :acreage, :is_seasonal)
  end
end
