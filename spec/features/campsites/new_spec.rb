require 'rails_helper'

RSpec.describe 'new campsite' do
  before :each do
    @campground = Campground.create!(name: "Echo Lake Campground", reservation_allowed: true, max_nights: 7)
  end
  it 'can link to create a new campsite' do
    visit "/campgrounds/#{@campground.id}/campsites"
    click_link 'Create Campsite'
    expect(current_path).to eq("/campgrounds/#{@campground.id}/campsites/new")
  end

  it 'can create a new campground' do
    visit "/campgrounds/#{@campground.id}/campsites/new"

    fill_in('Name', with: 'Echo Loop Site 4')
    fill_in(:tent_only, with: true)
    fill_in(:overnight_fee, with: 15.75)

    click_button('Create Campsite')
    expect(current_path).to eq("/campgrounds/#{@campground.id}/campsites")
    expect(page).to have_content('Echo Loop Site 4')
  end
end
