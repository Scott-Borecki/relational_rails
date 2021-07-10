require 'rails_helper'

RSpec.describe 'the trails new page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
  end

  it 'can link to the new page from the trails index' do
    visit '/trails'

    click_link 'Create Trail'

    expect(current_path).to eq('/trails/new')
  end

  it 'can create a new trail' do
    visit '/trails/new'
    save_and_open_page

    fill_in('Name', with: 'Five Lakes')
    fill_in('Length', with: '6')
    fill_in('Is loop', with: 'true')
    select('Denali', :from => 'national_park_id')
    click_button('Create Trail')

    expect(current_path).to eq("/trails")
    expect(page).to have_content('Five Lakes')
  end
end
