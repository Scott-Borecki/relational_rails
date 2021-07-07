require 'rails_helper'

RSpec.describe "national parks index page" do
  it 'can display index page' do
    denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    visit '/national_parks'

    expect(page).to have_content(denali.name)
    expect(page).to have_content(katmai.name)
    expect(page).to have_content(kenai_fjords.name)
  end
end
