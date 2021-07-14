require 'rails_helper'

RSpec.describe 'national parks edit page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denal', acreage: 6_100_000, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: false)
  end

  it 'can link to the national park edit page' do
    visit "/national_parks/#{@denali.id}"

    click_button 'Edit'

    expect(current_path).to eq("/national_parks/#{@denali.id}/edit")
  end

  it 'can prepopulate the edit form' do
    visit "/national_parks/#{@denali.id}/edit"

    expect(page).to have_field(:name, with: "#{@denali.name}")
    expect(page).to have_field(:acreage, with: "#{@denali.acreage}")
    expect(page).to have_checked_field(:is_seasonal)

    visit "/national_parks/#{@kenai_fjords.id}/edit"

    expect(page).to have_field(:name, with: "#{@kenai_fjords.name}")
    expect(page).to have_field(:acreage, with: "#{@kenai_fjords.acreage}")
    expect(page).to have_unchecked_field(:is_seasonal)
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
