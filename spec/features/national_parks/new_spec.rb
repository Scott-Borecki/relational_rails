require 'rails_helper'

RSpec.describe 'the national parks new page' do
  it 'can link to the new page from the national park index' do
    visit '/national_parks'

    click_link 'New National Park'

    expect(current_path).to eq('/national_parks/new')
  end

  it 'can create a new national park' do
    visit '/national_parks/new'

    fill_in('Name', with: 'Denali')
    fill_in('Acreage', with: '900')
    check('Is seasonal')
    click_button('Create National Park')

    expect(current_path).to eq("/national_parks")
    expect(page).to have_content("Denali")
  end

  it 'can link to trail index' do
    visit '/national_parks/new'
    click_link 'Trail Index'
    expect(current_path).to eq('/trails')
  end

  it 'can link to national park index' do
    visit '/national_parks/new'
    click_link 'National Park Index'
    expect(current_path).to eq('/national_parks')
  end

  it 'can link to campground index' do
    visit '/national_parks/new'
    click_link 'Campground Index'
    expect(current_path).to eq('/campgrounds')
  end

  it 'can link to campsite index' do
    visit '/national_parks/new'
    click_link 'Campsite Index'
    expect(current_path).to eq('/campsites')
  end
end
