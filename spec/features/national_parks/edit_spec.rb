require 'rails_helper'

RSpec.describe 'national parks edit page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denal', acreage: 6_100_000, is_seasonal: true)
  end

  it 'can link to the national park edit page' do
    visit "/national_parks/#{@denali.id}"

    click_link 'Update National Park'

    expect(current_path).to eq("/national_parks/#{@denali.id}/edit")
  end

  it 'can update a national park record' do
    visit '/national_parks'

    expect(page).to have_content("Denal")

    visit "/national_parks/#{@denali.id}/edit"

    fill_in('Name', with: 'Denali')
    fill_in('Acreage', with: '900')
    fill_in('Is seasonal', with: 'true')
    click_button('Update National Park')

    expect(current_path).to eq("/national_parks/#{@denali.id}")
    expect(page).to have_content('Denali')
  end
end
