require 'rails_helper'

RSpec.describe 'the national parks new page' do
  it 'can link to the new page from the national park index' do
    visit '/national_parks'

    click_link 'New National Park'

    expect(current_path).to eq('/national_parks/new')
  end

  it 'can create a new national park' do
    visit '/national_parks/new'

    fill_in('Name:', with: 'Denali')
    fill_in('Acres:', with: '900')
    check('Seasonal:')
    click_button('Create National Park')

    expect(current_path).to eq('/national_parks')
    expect(page).to have_content('Denali')
  end

  it 'can link to the index pages' do
    pages = [['Welcome Bear', '/'],
             ['Trail Index', '/trails'],
             ['National Park Index', '/national_parks'],
             ['Campground Index', '/campgrounds'],
             ['Campsite Index', '/campsites']]
    pages.each do |link_text, path|
      visit '/national_parks/new'
      click_link "#{link_text}"
      expect(current_path).to eq("#{path}")
    end
  end
end
