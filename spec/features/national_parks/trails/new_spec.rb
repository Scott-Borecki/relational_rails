require 'rails_helper'

RSpec.describe 'the national parks trails new page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
  end

  it 'can link to the new page from the national parks trails index' do
    visit "/national_parks/#{@denali.id}/trails"

    click_link 'Create Trail'

    expect(current_path).to eq("/national_parks/#{@denali.id}/trails/new")
  end

  it 'can create a new trail' do
    visit "/national_parks/#{@denali.id}/trails/new"

    fill_in('Name', with: 'Five Lakes')
    fill_in('Length', with: '6')
    check('Is loop')
    click_button('Create Trail')

    expect(current_path).to eq("/national_parks/#{@denali.id}/trails")
    expect(page).to have_content('Five Lakes')
  end

  it 'can link to the index pages' do
    pages = [["Trail Index", "/trails"],
             ["National Park Index", "/national_parks"],
             ["Campground Index", "/campgrounds"],
             ["Campsite Index", "/campsites"]]
    pages.each do |link_text, path|
      visit "/national_parks/#{@denali.id}/trails/new"
      click_link "#{link_text}"
      expect(current_path).to eq("#{path}")
    end
  end
end
