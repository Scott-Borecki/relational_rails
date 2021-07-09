require 'rails_helper'

RSpec.describe 'the national parks new page' do
  it 'can link to the new page from the national park index' do
    visit '/national_parks'

    click_link 'New National Park'

    expect(current_path).to eq('/national_parks/new')
  end

  it 'can create a new artist' do
    visit '/national_parks/new'

    fill_in('Name', with: 'Denali')
    fill_in('Acreage', with: '900')
    fill_in('Is seasonal', with: 'true')
    click_button('Create National Park')

    expect(current_path).to eq("/national_parks")
    expect(page).to have_content("Denali")
  end
end
