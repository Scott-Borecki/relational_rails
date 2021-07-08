require 'rails_helper'

RSpec.describe "national parks index page" do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)
  end

  it 'can display index page' do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    visit '/national_parks'

    expect(page).to have_content(@denali.name)
    expect(page).to have_content(@katmai.name)
    expect(page).to have_content(@kenai_fjords.name)
  end

  it 'can display national parks sorted by most recently created' do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    sleep(1)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    sleep(1)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    visit '/national_parks'

    expect(page).to have_content("Created At: #{@denali.created_at}")
    expect(page).to have_content("Created At: #{@katmai.created_at}")
    expect(page).to have_content("Created At: #{@kenai_fjords.created_at}")

    expect(@kenai_fjords.name).to appear_before(@denali.name)
    expect(@kenai_fjords.name).to appear_before(@katmai.name)
    expect(@katmai.name).to appear_before(@denali.name)
  end

  it 'can link to trail index' do
    visit "/national_parks"
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end

  it 'can link to national park index' do
    visit "/national_parks"
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')
  end

  it 'can link to campground index' do
    visit "/national_parks"
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')
  end

  it 'can link to campsite index' do
    visit "/national_parks"
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')
  end
end
