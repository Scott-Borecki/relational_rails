require 'rails_helper'

RSpec.describe 'national park destroy page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
  end

  it 'can delete record of national park and associated trails' do
    visit "/national_parks/#{@denali.id}"

    click_link "Delete #{@denali.name}"

    expect(current_path).to eq("/national_parks")
    expect(page).to_not have_content('Denali')
  end
end
