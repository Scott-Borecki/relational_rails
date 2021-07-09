require 'rails_helper'

RSpec.describe 'new campground' do
    it 'can link to create a new campground' do
      visit '/campgrounds'
      click_link 'New Campground'
      expect(current_path).to eq('/campgrounds/new')
    end

    it 'can create a new campground' do
      visit '/campgrounds/new'

      fill_in('Name', with: 'Echo Lake Campground')
      fill_in(:reservation_allowed, with: true)
      fill_in(:max_nights, with: 7)

      click_button('Create Campground')
      expect(current_path).to eq('/campgrounds')
      expect(page).to have_content('Echo Lake Campground')
    end
end
