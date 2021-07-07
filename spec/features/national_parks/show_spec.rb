require 'rails_helper'

RSpec.describe "national parks show page" do
  it 'can display show page' do
    denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    visit "/national_parks/#{denali.id}"

    expect(page).to have_content(denali.name)
    expect(page).to have_content("Acreage: #{denali.acreage}")
    expect(page).to have_content("Seasonal?: #{denali.is_seasonal}")
    expect(page).to have_content("Created At: #{denali.created_at}")
    expect(page).to have_content("Updated At: #{denali.updated_at}")

    visit "/national_parks/#{katmai.id}"

    expect(page).to have_content(katmai.name)
    expect(page).to have_content("Acreage: #{katmai.acreage}")
    expect(page).to have_content("Seasonal?: #{katmai.is_seasonal}")
    expect(page).to have_content("Created At: #{katmai.created_at}")
    expect(page).to have_content("Updated At: #{katmai.updated_at}")

    visit "/national_parks/#{kenai_fjords.id}"

    expect(page).to have_content(kenai_fjords.name)
    expect(page).to have_content("Acreage: #{kenai_fjords.acreage}")
    expect(page).to have_content("Seasonal?: #{kenai_fjords.is_seasonal}")
    expect(page).to have_content("Created At: #{kenai_fjords.created_at}")
    expect(page).to have_content("Updated At: #{kenai_fjords.updated_at}")
  end
end
