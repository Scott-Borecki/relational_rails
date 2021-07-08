require 'rails_helper'

RSpec.describe 'campgrounds index page' do
  before :each do
    @sunset_point = Campground.create!(name: "Sunset Point Campground", reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: "Cherry Creek Campground", reservation_allowed: true, max_nights: 14)
    @chatfield = Campground.create!(name: "Chatfield Campground", reservation_allowed: true, max_nights: 14)
  end

  it 'shows all the campgrounds and their names' do
    visit '/campgrounds'

    expect(page).to have_content(@sunset_point.name)
    expect(page).to have_content(@cherry_creek.name)
    expect(page).to have_content(@chatfield.name)
  end
end
