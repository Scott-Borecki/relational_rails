require 'rails_helper'

RSpec.describe 'trails edit page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @triple = @denali.trails.create!(name: 'Tripl Lakes Trail', length: 9, is_loop: false)
  end

  it 'can link to the trail edit page' do
    visit "/trails/#{@triple.id}"

    click_link 'Update Trail'

    expect(current_path).to eq("/trails/#{@triple.id}/edit")
  end

  it 'can update a trail record' do
    visit '/trails'

    expect(page).to have_content("Tripl Lakes Trail")

    visit "/trails/#{@triple.id}/edit"

    fill_in('Name', with: 'Triple Lakes Trail')
    fill_in('Length', with: '9')
    fill_in('Is loop', with: 'false')
    select('Denali', :from => 'national_park_id')
    click_button('Update Trail')

    expect(current_path).to eq("/trails/#{@triple.id}")
    expect(page).to have_content('Triple Lakes Trail')
  end
end
