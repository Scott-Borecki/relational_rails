require 'rails_helper'

RSpec.describe 'trails show page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)

    @trails = [@triple, @quadruple, @double, @single]
  end

  it 'can display show page' do
    @trails.each do |trail|
      visit "/trails/#{trail.id}"

      expect(page).to have_content(trail.name)
      expect(page).to have_button('Edit')
      expect(page).to have_button('Delete')
      expect(page).to have_content("Created At: #{trail.created_at}")
      expect(page).to have_content("Updated At: #{trail.updated_at}")
      expect(page).to have_content("National Park: #{NationalPark.find(trail.national_park_id).name}")
      expect(page).to have_content("Loop?: #{trail.is_loop}")
      expect(page).to have_content("Length: #{trail.length}")
    end
  end

  it 'can link to the index pages' do
    pages = [['Trail Index', '/trails'],
             ['National Park Index', '/national_parks'],
             ['Campground Index', '/campgrounds'],
             ['Campsite Index', '/campsites']]
    @trails.each do |trail|
      pages.each do |link_text, path|
        visit "/trails/#{trail.id}"
        click_link "#{link_text}"
        expect(current_path).to eq("#{path}")
      end
    end
  end
end
