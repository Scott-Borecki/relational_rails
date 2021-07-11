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

  it 'can link to trail index' do
    visit '/trails/new'
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end

  it 'can link to national park index' do
    visit '/trails/new'
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')
  end

  it 'can link to campground index' do
    visit '/trails/new'
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')
  end

  it 'can link to campsite index' do
    visit '/trails/new'
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')
  end
end
