require 'rails_helper'

RSpec.describe 'delete a campsite' do
  before :each do
    @campground = Campground.create!(name: 'Sunset Point Campground', reservation_allowed: false, max_nights: 7)
    @campsite = @campground.campsites.create!(name: 'Site 15', tent_only: true, overnight_fee: 26)
  end

  it 'can delete a campsite' do
    visit '/campsites'
    expect(page).to have_content('Site 15')

    visit "campsites/#{@campsite.id}"

    click_button 'Delete'

    expect(current_path).to eq('/campsites')
    expect(page).to_not have_content('Site 15')
  end

  it 'can delete a campsite from index page' do
    visit "/campsites"

    expect(page).to have_content('Site 15')

    within("#csid#{@campsite.id}") do
      click_button 'Delete'
    end

    expect(current_path).to eq('/campsites')
    expect(page).to_not have_content('Site 15')
  end
end
