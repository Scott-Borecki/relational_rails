require 'rails_helper'

RSpec.describe "trails show page" do
  it 'can display show page' do
    denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    triple = denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    quadruple = denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    double = katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    single = kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)

    visit "/trails/#{single.id}"

    expect(page).to have_content(single.name)
    expect(page).to have_content("Length: #{single.length}")
    expect(page).to have_content("Loop?: #{single.is_loop}")
    expect(page).to have_content("National Park: Kenai Fjords")
    expect(page).to have_content("Created At: #{single.created_at}")
    expect(page).to have_content("Updated At: #{single.updated_at}")

    visit "/trails/#{double.id}"

    expect(page).to have_content(double.name)
    expect(page).to have_content("Length: #{double.length}")
    expect(page).to have_content("Loop?: #{double.is_loop}")
    expect(page).to have_content("National Park: Katmai")
    expect(page).to have_content("Created At: #{double.created_at}")
    expect(page).to have_content("Updated At: #{double.updated_at}")

    visit "/trails/#{triple.id}"

    expect(page).to have_content(triple.name)
    expect(page).to have_content("Length: #{triple.length}")
    expect(page).to have_content("Loop?: #{triple.is_loop}")
    expect(page).to have_content("National Park: Denali")
    expect(page).to have_content("Created At: #{triple.created_at}")
    expect(page).to have_content("Updated At: #{triple.updated_at}")

    visit "/trails/#{quadruple.id}"

    expect(page).to have_content(quadruple.name)
    expect(page).to have_content("Length: #{quadruple.length}")
    expect(page).to have_content("Loop?: #{quadruple.is_loop}")
    expect(page).to have_content("National Park: Denali")
    expect(page).to have_content("Created At: #{quadruple.created_at}")
    expect(page).to have_content("Updated At: #{quadruple.updated_at}")
  end
end
