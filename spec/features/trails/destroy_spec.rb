require 'rails_helper'

RSpec.describe 'trail destroy page' do
  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: true)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: true)
  end

  it 'can delete record of trail from trails index' do
    visit "/trails"

    click_link "Delete #{@triple.name}"

    expect(current_path).to eq("/trails")
    expect(page).to_not have_content('Triple Lakes Trail')
    expect(page).to have_content('Quadruple Lakes Trail')
  end

  it 'can delete record of trail from national park trails index' do
    visit "/national_parks/#{@denali.id}/trails"

    click_link "Delete #{@triple.name}"

    expect(current_path).to eq("/trails")
    expect(page).to_not have_content('Triple Lakes Trail')
    expect(page).to have_content('Quadruple Lakes Trail')
  end
end
