require 'rails_helper'

RSpec.describe 'campsite show page' do
  before :each do
    @sunset_point = Campground.create!(name: 'Sunset Point Campground', reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: 'Cherry Creek Campground', reservation_allowed: true, max_nights: 14)
    @chatfield = Campground.create!(name: 'Chatfield Campground', reservation_allowed: true, max_nights: 14)
    @site_15 = @sunset_point.campsites.create!(name: 'Site 15', tent_only: true, overnight_fee: 26)
    @site_18 = @sunset_point.campsites.create!(name: 'Site 18', tent_only: false, overnight_fee: 52)
    @cottonwood_111= @cherry_creek.campsites.create!(name: 'Cottonweood Grove Site 111', tent_only: false, overnight_fee: 28)
    @abilene_10= @cherry_creek.campsites.create!(name: 'Abilene Site 10', tent_only: false, overnight_fee: 41)
    @a_001 = @chatfield.campsites.create!(name: 'A Loop Site 1', tent_only: false, overnight_fee: 41)
    @group_a = @chatfield.campsites.create!(name: 'Group Site A', tent_only: false, overnight_fee: 200)
  end

  it "shows a campsite's name and details" do
    visit "/campsites/#{@site_15.id}"

    expect(page).to have_content(@site_15.name)
    expect(page).to have_content("Campground: #{@sunset_point.name}")
    expect(page).to have_content("Campsite is Tent Only: #{@site_15.tent_only}")
    expect(page).to have_content("Overnight Fee: #{@site_15.overnight_fee}")
    expect(page).to have_content("Created at: #{@site_15.created_at}")
    expect(page).to have_content("Updated at: #{@site_15.updated_at}")

    expect(page).to_not have_content(@site_18.name)
  end

  it 'can link to other index pages' do
    visit "/campsites/#{@site_15.id}"
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')

    visit "/campsites/#{@site_15.id}"
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')

    visit "/campsites/#{@site_15.id}"
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')

    visit "/campsites/#{@site_15.id}"
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end
end
