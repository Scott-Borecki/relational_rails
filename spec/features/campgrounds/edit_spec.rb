require 'rails_helper'

RSpec.describe 'edit campground' do
  before :each do
    @campground = Campground.create!(name: "Sunset Point Campground", reservation_allowed: false, max_nights: 7)
  end
  it 'can link to edit a campground' do
    visit "/campgrounds/#{@campground.id}"
    click_link "Update #{@campground.id}"
    expect(current_path).to eq("/campgrounds/#{@campground.id}/edit")
  end

  it 'can update a campground' do
    visit "/campgrounds/#{@campground.id}/edit"

    fill_in('Name', with: 'Echo Lake Campground')
    fill_in(:reservation_allowed, with: false)
    fill_in(:max_nights, with: 14)

    click_button('Update Campground')
    expect(current_path).to eq("/campgrounds/#{@campground.id}")
    expect(page).to have_content('Echo Lake Campground')
  end

  it 'can link to edit campground on idex page' do
    visit '/campgrounds'
    click_button "Edit", match: :first
    expect(current_path).to eq("/campgrounds/#{@campground.id}/edit")
  end
end
