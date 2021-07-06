class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.all
  end
end
