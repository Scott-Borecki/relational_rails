require 'rails_helper'

RSpec.describe 'edit campsite' do
  before :each do
    @campground = Campground.create!(name: "Sunset Point campsite", reservation_allowed: false, max_nights: 7)
    @campsite = @campground.campsites.create!(name: "Site 15", tent_only: true, overnight_fee: 26)
  end
  it 'can link to edit a campsite' do
    visit "/campsites/#{@campsite.id}"
    click_button 'Edit'
    expect(current_path).to eq("/campsites/#{@campsite.id}/edit")
  end

  it 'can update a campsite' do
    visit "/campsites/#{@campsite.id}"
    expect(page).to_not have_content('Cottonweood Grove Site 111')

    visit "/campsites/#{@campsite.id}/edit"

    fill_in(:name, with: 'Cottonweood Grove Site 111')
    fill_in(:overnight_fee, with: 28)
    check(:tent_only)

    click_button('Update Campsite')
    expect(current_path).to eq("/campsites/#{@campsite.id}")
    expect(page).to have_content('Cottonweood Grove Site 111')
  end

  it 'can link to edit campsite on idex page' do
    visit '/campsites'
    click_button "Edit #{@campsite.name}"
    expect(current_path).to eq("/campsites/#{@campsite.id}/edit")
  end

  it "can link to edit campsite on campground's campsite idex page" do
    visit "/campgrounds/#{@campground.id}/campsites"
    click_button "Edit #{@campsite.name}"
    expect(current_path).to eq("/campsites/#{@campsite.id}/edit")
  end
end
