class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
  end

  def create
    Trail.create(trail_params)
    redirect_to '/trails'
  end

  private
  def trail_params
    params.permit(:name, :length, :is_loop, :national_park_id)
  end
end
