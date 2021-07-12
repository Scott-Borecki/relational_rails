require 'rails_helper'

RSpec.describe 'delete a campground' do
  before :each do
    @campground = Campground.create!(name: "Sunset Point Campground", reservation_allowed: false, max_nights: 7)
    @site_15 = @campground.campsites.create!(name: "Site 15", tent_only: true, overnight_fee: 26)
    @site_18 = @campground.campsites.create!(name: "Site 18", tent_only: true, overnight_fee: 52)
  end

  it 'can delete a campground and campsites in campground' do
    visit "/campgrounds/#{@campground.id}"
    expect(page).to have_content('Sunset Point Campground')

    visit '/campsites'
    expect(page).to have_content('Site 15')
    expect(page).to have_content('Site 18')

    visit "/campgrounds/#{@campground.id}"

    click_button 'Delete'

    expect(current_path).to eq('/campgrounds')
    expect(page).to_not have_content('Sunset Point Campground')

    visit '/campsites'
    expect(page).to_not have_content('Site 15')
    expect(page).to_not have_content('Site 18')
  end

  it 'can delete a campground from index page' do
    visit "/campgrounds"

    expect(page).to have_content('Sunset Point Campground')

    click_button "Delete #{@campground.name}"

    expect(current_path).to eq('/campgrounds')
    expect(page).to_not have_content('Sunset Point Campground')
  end
end
