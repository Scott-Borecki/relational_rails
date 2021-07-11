require 'rails_helper'

RSpec.describe "national parks show page" do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)

    @parks = [@denali, @katmai, @kenai_fjords]
  end

  it 'can display show page' do
    @parks.each do |park|
      visit "/national_parks/#{park.id}"

      expect(page).to have_content(park.name)
      expect(page).to have_content("Acreage: #{park.acreage}")
      expect(page).to have_content("Seasonal?: #{park.is_seasonal}")
      expect(page).to have_content("Number of Trails: #{park.trail_count}")
      expect(page).to have_content("Created At: #{park.created_at}")
      expect(page).to have_content("Updated At: #{park.updated_at}")
      expect(page).to have_link("Delete #{park.name}")
    end
  end

  it 'can link to the index pages' do
    pages = [["Trail Index", "/trails"],
             ["National Park Index", "/national_parks"],
             ["Campground Index", "/campgrounds"],
             ["Campsite Index", "/campsites"]]
    @parks.each do |park|
      pages.each do |link_text, path|
        visit "/national_parks/#{park.id}"
        click_link "#{link_text}"
        expect(current_path).to eq("#{path}")
      end
    end
  end
end
