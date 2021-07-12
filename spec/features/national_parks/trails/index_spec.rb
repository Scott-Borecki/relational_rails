require 'rails_helper'

RSpec.describe 'national parks trails index page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)

    @parks = [@denali, @katmai, @kenai_fjords]
    @park_trails = [[@denali, [@triple, @quadruple]], [@katmai, [@double]], [@kenai_fjords, [@single]]]
  end

  it 'can display all of the trails at the national park' do
    @park_trails.each do |park, trails|
      trails.each do |trail|
        visit "/national_parks/#{park.id}/trails"

        expect(page).to have_content(trail.name)
        expect(page).to have_button("Edit #{trail.name}")
        expect(page).to have_button("Delete #{trail.name}")
        expect(page).to have_content("Created at: #{trail.created_at}")
        expect(page).to have_content("Updated at: #{trail.updated_at}")
        expect(page).to have_content("Loop?: #{trail.is_loop}")
        expect(page).to have_content("Length: #{trail.length} miles")
      end
    end
  end

  it 'can link to the trails edit page' do
    @park_trails.each do |park, trails|
      trails.each do |trail|
        visit "/national_parks/#{park.id}/trails"
        click_button "Edit #{trail.name}"
        expect(current_path).to eq("/trails/#{trail.id}/edit")
      end
    end
  end

  it 'can link to sort trails alphabetically by name' do
    visit "/national_parks/#{@denali.id}/trails"

    click_link 'Sort Trails By Name'

    expect(current_path).to eq("/national_parks/#{@denali.id}/trails")
    expect(@quadruple.name).to appear_before(@triple.name)
  end

  it 'can return trails with more than a specified length' do
    visit "/national_parks/#{@denali.id}/trails"

    fill_in('Length', with: '10')
    click_button 'Only return trails with more than this length'

    expect(current_path).to eq("/national_parks/#{@denali.id}/trails")
    expect(page).to have_content("#{@quadruple.name}")
    expect(page).to_not have_content("#{@triple.name}")
  end

  it 'can link to the index pages' do
    pages = [['Trail Index', '/trails'],
             ['National Park Index', '/national_parks'],
             ['Campground Index', '/campgrounds'],
             ['Campsite Index', '/campsites']]
    @parks.each do |park|
      pages.each do |link_text, path|
        visit "/national_parks/#{park.id}/trails"
        click_link "#{link_text}"
        expect(current_path).to eq("#{path}")
      end
    end
  end
end
