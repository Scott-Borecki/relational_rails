require 'rails_helper'

RSpec.describe 'welcome index page' do
  it 'can display welcome page' do
    visit '/'

    expect(page).to have_content("Yay! You're on Relational Rails")
  end

  it 'can link to national parks page' do
    visit '/'
    click_link 'National Parks'
    expect(current_path).to eq('/national_parks')
  end

  it 'can link to trails page' do
    visit '/'
    click_link 'Trails'
    expect(current_path).to eq('/trails')
  end

  it 'can link to campgrounds page' do
    visit '/'
    click_link 'Campgrounds'
    expect(current_path).to eq('/campgrounds')
  end

  it 'can link to campsites page' do
    visit '/'
    click_link 'Campsites'
    expect(current_path).to eq('/campsites')
  end

  it 'can link to other index pages' do
    visit '/'
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')

    visit '/'
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')

    visit '/'
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')

    visit '/'
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end
end
