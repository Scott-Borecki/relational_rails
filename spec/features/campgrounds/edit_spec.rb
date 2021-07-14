require 'rails_helper'

RSpec.describe 'edit campground' do
  before :each do
    @campground = Campground.create!(name: 'Sunset Point Campground', reservation_allowed: false, max_nights: 7)
    @campground_2 = Campground.create!(name: 'Another Campground', reservation_allowed: true, max_nights: 12)
  end
  it 'can link to edit a campground' do
    visit "/campgrounds/#{@campground.id}"
    click_button 'Edit'
    expect(current_path).to eq("/campgrounds/#{@campground.id}/edit")
  end

  it 'can update a campground' do
    visit "/campgrounds/#{@campground.id}"
    expect(page).to_not have_content('Echo Lake Campground')

    visit "/campgrounds/#{@campground.id}/edit"

    fill_in(:name, with: 'Echo Lake Campground')
    fill_in(:max_nights, with: 14)
    uncheck(:reservation_allowed)

    click_button('Update Campground')
    expect(current_path).to eq("/campgrounds/#{@campground.id}")

    expect(page).to have_content('Echo Lake Campground')
    expect(page).to have_content('Max Nights Stay: 14')
    expect(page).to have_content('Reservations Allowed: false')
  end

  it 'can prefill current campground information' do
    visit "/campgrounds/#{@campground.id}/edit"

    expect(page).to have_field(:name, with: "#{@campground.name}")
    expect(page).to have_field(:max_nights, with: "#{@campground.max_nights}")
    expect(page).to have_unchecked_field(:reservation_allowed)
  end

  it 'can link to edit campground on idex page' do
    visit '/campgrounds'

    within("#cgid#{@campground.id}") do
      click_button "Edit"
    end

    expect(current_path).to eq("/campgrounds/#{@campground.id}/edit")

    visit '/campgrounds'

    within("#cgid#{@campground_2.id}") do
      click_button "Edit"
    end

    expect(current_path).to eq("/campgrounds/#{@campground_2.id}/edit")
  end
end
