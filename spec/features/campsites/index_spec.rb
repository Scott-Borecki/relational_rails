require 'rails_helper'

RSpec.describe 'campsites index page' do
  before :each do
    @sunset_point = Campground.create!(name: "Sunset Point Campground", reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: "Cherry Creek Campground", reservation_allowed: true, max_nights: 14)
    @chatfield = Campground.create!(name: "Chatfield Campground", reservation_allowed: true, max_nights: 14)
    @site_15 = @sunset_point.campsites.create!(name: "Site 15", tent_only: true, overnight_fee: 26)
    @site_18 = @sunset_point.campsites.create!(name: "Site 18", tent_only: false, overnight_fee: 52)
    @cottonwood_111= @cherry_creek.campsites.create!(name: "Cottonweood Grove Site 111", tent_only: false, overnight_fee: 28)
    @abilene_10= @cherry_creek.campsites.create!(name: "Abilene Site 10", tent_only: false, overnight_fee: 41)
    @a_001 = @chatfield.campsites.create!(name: "A Loop Site 1", tent_only: false, overnight_fee: 41)
    @group_a = @chatfield.campsites.create!(name: "Group Site A", tent_only: false, overnight_fee: 200)
  end

  it 'shows all the campsites and their names' do
    visit '/campsites'

    expect(page).to have_content(@site_15.name)
    expect(page).to have_content(@site_18.name)
    expect(page).to have_content(@cottonwood_111.name)
    expect(page).to have_content(@abilene_10.name)
    expect(page).to have_content(@a_001.name)
    expect(page).to have_content(@group_a.name)
  end

  it 'can link to show a campground' do
    visit '/campsites'
    click_link "#{@site_15.name}"
    expect(current_path).to eq("/campsites/#{@site_15.id}")

    visit '/campsites'
    click_link "#{@site_18.name}"
    expect(current_path).to eq("/campsites/#{@site_18.id}")

    visit '/campsites'
    click_link "#{@cottonwood_111.name}"
    expect(current_path).to eq("/campsites/#{@cottonwood_111.id}")

    visit '/campsites'
    click_link "#{@abilene_10.name}"
    expect(current_path).to eq("/campsites/#{@abilene_10.id}")

    visit '/campsites'
    click_link "#{@a_001.name}"
    expect(current_path).to eq("/campsites/#{@a_001.id}")

    visit '/campsites'
    click_link "#{@group_a.name}"
    expect(current_path).to eq("/campsites/#{@group_a.id}")
  end
end
