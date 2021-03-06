require 'rails_helper'

RSpec.describe 'campground campsites index' do
  before :each do
    @sunset_point = Campground.create!(name: 'Sunset Point Campground', reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: 'Cherry Creek Campground', reservation_allowed: true, max_nights: 14)
    @chatfield = Campground.create!(name: 'Chatfield Campground', reservation_allowed: true, max_nights: 14)
    @site_15 = @sunset_point.campsites.create!(name: 'Site 15', tent_only: true, overnight_fee: 26)
    @site_18 = @sunset_point.campsites.create!(name: 'Site 18', tent_only: false, overnight_fee: 52)
    @cottonwood_111= @cherry_creek.campsites.create!(name: 'Cottonwood Grove Site 111', tent_only: false, overnight_fee: 28)
    @abilene_10= @cherry_creek.campsites.create!(name: 'Abilene Site 10', tent_only: false, overnight_fee: 41)
    @a_001 = @chatfield.campsites.create!(name: 'A Loop Site 1', tent_only: false, overnight_fee: 41)
    @group_a = @chatfield.campsites.create!(name: 'Group Site A', tent_only: false, overnight_fee: 200)
  end

  it "shows a campground's campsites and details" do
    visit "/campgrounds/#{@sunset_point.id}/campsites"

    expect(page).to have_content(@sunset_point.name)
    expect(page).to have_content(@site_15.name)
    expect(page).to have_content("Campsite is Tent Only: #{@site_15.tent_only}")
    expect(page).to have_content("Overnight Fee: #{@site_15.overnight_fee}")
    expect(page).to have_content("Created at: #{@site_15.created_at}")
    expect(page).to have_content("Updated at: #{@site_15.updated_at}")
    expect(page).to have_content(@site_18.name)
    expect(page).to have_content("Campsite is Tent Only: #{@site_18.tent_only}")
    expect(page).to have_content("Overnight Fee: #{@site_18.overnight_fee}")
    expect(page).to have_content("Created at: #{@site_18.created_at}")
    expect(page).to have_content("Updated at: #{@site_18.updated_at}")
    expect(page).to_not have_content(@abilene_10.name)
  end

  it 'can link to return to campground' do
    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link "#{@sunset_point.name} Details"
    expect(current_path).to eq("/campgrounds/#{@sunset_point.id}")
  end

  it 'can link to a campsite page' do
    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link "#{@site_15.name}"
    expect(current_path).to eq("/campsites/#{@site_15.id}")

    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link "#{@site_18.name}"
    expect(current_path).to eq("/campsites/#{@site_18.id}")
  end

  it 'can link to other index pages' do
    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')

    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')

    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')

    visit "/campgrounds/#{@sunset_point.id}/campsites"
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end

  it 'can link to sort campsites by name' do
    visit "/campgrounds/#{@cherry_creek.id}/campsites"
    click_link 'Sort by Name'
    expect(current_path).to eq("/campgrounds/#{@cherry_creek.id}/campsites")
    expect(@abilene_10.name).to appear_before(@cottonwood_111.name)
  end

  it 'can view records by over a given threshold' do
    visit "/campgrounds/#{@cherry_creek.id}/campsites"
    expect(page).to have_content(@cottonwood_111.name)

    fill_in(:amount, with: 30)
    click_button 'Submit'

    expect(current_path).to eq("/campgrounds/#{@cherry_creek.id}/campsites")
    expect(page).to have_content(@abilene_10.name)
    expect(page).to_not have_content(@cottonwood_111.name)
  end
end
