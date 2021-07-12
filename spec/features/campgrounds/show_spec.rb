require 'rails_helper'

RSpec.describe 'campground show page' do
  before :each do
    @sunset_point = Campground.create!(name: 'Sunset Point Campgroun', reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: 'Cherry Creek Campground', reservation_allowed: true, max_nights: 14)
  end

  it "shows a campground's name and details" do
    visit "/campgrounds/#{@sunset_point.id}"

    expect(page).to have_content(@sunset_point.name)
    expect(page).to have_content("Reservations Allowed: #{@sunset_point.reservation_allowed}")
    expect(page).to have_content("Max Nights Stay: #{@sunset_point.max_nights}")
    expect(page).to have_content("Created at: #{@sunset_point.created_at}")
    expect(page).to have_content("Updated at: #{@sunset_point.updated_at}")

    expect(page).to_not have_content(@cherry_creek.name)

    visit "/campgrounds/#{@cherry_creek.id}"

    expect(page).to have_content(@cherry_creek.name)
    expect(page).to have_content("Reservations Allowed: #{@cherry_creek.reservation_allowed}")
    expect(page).to have_content("Max Nights Stay: #{@cherry_creek.max_nights}")
    expect(page).to have_content("Created at: #{@cherry_creek.created_at}")
    expect(page).to have_content("Updated at: #{@cherry_creek.updated_at}")

    expect(page).to_not have_content(@sunset_point.name)
  end

  it "can show the number of campground's campsites" do
    visit "/campgrounds/#{@sunset_point.id}"
    expect(page).to have_content("Number of Campsites: #{@sunset_point.campsite_count}")

    visit "/campgrounds/#{@cherry_creek.id}"
    expect(page).to have_content("Number of Campsites: #{@cherry_creek.campsite_count}")

  end

  it 'can link to list of campsites in campground' do
    visit "/campgrounds/#{@sunset_point.id}"
    click_link 'Campsites at Campground'
    expect(current_path).to eq("/campgrounds/#{@sunset_point.id}/campsites")

    visit "/campgrounds/#{@cherry_creek.id}"
    click_link 'Campsites at Campground'
    expect(current_path).to eq("/campgrounds/#{@cherry_creek.id}/campsites")
  end

  it 'can link to other index pages' do
    visit "/campgrounds/#{@sunset_point.id}"
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')

    visit "/campgrounds/#{@sunset_point.id}"
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')

    visit "/campgrounds/#{@sunset_point.id}"
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')

    visit "/campgrounds/#{@sunset_point.id}"
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end
end
