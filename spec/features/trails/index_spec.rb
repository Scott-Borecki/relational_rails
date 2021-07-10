require 'rails_helper'

RSpec.describe "trails index page" do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)
  end

  it 'can display index page with only loop trails' do
    visit '/trails'

    expect(page).to have_content(@single.name)
    expect(page).to have_content("Length: #{@single.length}")
    expect(page).to have_content("Loop?: #{@single.is_loop}")
    expect(page).to have_content("National Park: Kenai Fjords")
    expect(page).to have_content("Created At: #{@single.created_at}")
    expect(page).to have_content("Updated At: #{@single.updated_at}")

    expect(page).to have_content(@double.name)
    expect(page).to have_content("Length: #{@double.length}")
    expect(page).to have_content("Loop?: #{@double.is_loop}")
    expect(page).to have_content("National Park: Katmai")
    expect(page).to have_content("Created At: #{@double.created_at}")
    expect(page).to have_content("Updated At: #{@double.updated_at}")

    expect(page).to_not have_content(@triple.name)
    expect(page).to_not have_content(@quadruple.name)
  end

  it 'can link to trail index' do
    visit "/trails"
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end

  it 'can link to national park index' do
    visit "/trails"
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')
  end

  it 'can link to campground index' do
    visit "/trails"
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')
  end

  it 'can link to campsite index' do
    visit "/trails"
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')
  end
end
