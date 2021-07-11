require 'rails_helper'

RSpec.describe "national parks index page" do
  describe "index page tests without sleep" do
    before :each do
      @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
      @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
      @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

      @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)
      @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
      @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: true)
      @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: true)
      @five = @kenai_fjords.trails.create!(name: 'Five Lakes Trail', length: 5, is_loop: true)
      @single = @denali.trails.create!(name: 'Six Lakes Trail', length: 6, is_loop: true)

      @parks = [@denali, @katmai, @kenai_fjords]
    end

    it 'can display index page' do
      visit '/national_parks'

      @parks.each do |park|
        expect(page).to have_content(park.name)
      end
    end

    it 'can link to the national park edit page' do
      @parks.each do |park|
        visit '/national_parks'
        click_link "Update #{park.name}"
        expect(current_path).to eq("/national_parks/#{park.id}/edit")
      end
    end

    it 'can link to the new national park page' do
      visit '/national_parks'

      click_link "New National Park"

      expect(current_path).to eq('/national_parks/new')
    end

    it 'can link to the index pages' do
      pages = [["Trail Index", "/trails"],
               ["National Park Index", "/national_parks"],
               ["Campground Index", "/campgrounds"],
               ["Campsite Index", "/campsites"]]
      pages.each do |link_text, path|
        visit "/national_parks"
        click_link "#{link_text}"
        expect(current_path).to eq("#{path}")
      end
    end

    it 'can sort national parks by number of trails' do
      visit '/national_parks'

      click_link "Sort By Number of Trails"

      expect(current_path).to eq('/national_parks')
      expect(@denali.name).to appear_before(@katmai.name)
      expect(@denali.name).to appear_before(@kenai_fjords.name)
      expect(@kenai_fjords.name).to appear_before(@katmai.name)
    end
  end

  describe 'index page tests with sleep' do
    it 'can display national parks sorted by most recently created' do
      denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
      sleep(1)
      katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
      sleep(1)
      kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)
      parks = [denali, katmai, kenai_fjords]

      visit '/national_parks'

      parks.each do |park|
        expect(page).to have_content("Created At: #{park.created_at}")
      end

      expect(kenai_fjords.name).to appear_before(denali.name)
      expect(kenai_fjords.name).to appear_before(katmai.name)
      expect(katmai.name).to appear_before(denali.name)
    end
  end
end
