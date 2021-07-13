require 'rails_helper'

RSpec.describe 'national parks edit page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denal', acreage: 6_100_000, is_seasonal: true)
  end

  it 'can link to the national park edit page' do
    visit "/national_parks/#{@denali.id}"

    click_button 'Edit'

    expect(current_path).to eq("/national_parks/#{@denali.id}/edit")
  end

  it 'can update a national park record' do
    visit '/national_parks'

    expect(page).to have_content('Denal')

    visit "/national_parks/#{@denali.id}/edit"

    fill_in('Name:', with: 'Denali')
    fill_in('Acres:', with: '900')
    check('Seasonal:')
    click_button('Update National Park')

    expect(current_path).to eq("/national_parks/#{@denali.id}")
    expect(page).to have_content('Denali')
  end

  it 'can link to the index pages' do
    pages = [['Trail Index', '/trails'],
             ['National Park Index', '/national_parks'],
             ['Campground Index', '/campgrounds'],
             ['Campsite Index', '/campsites']]
    pages.each do |link_text, path|
      visit "/national_parks/#{@denali.id}/edit"
      click_link "#{link_text}"
      expect(current_path).to eq("#{path}")
    end
  end
end
