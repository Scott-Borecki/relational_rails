require 'rails_helper'

describe Trail, type: :model do
  it { should belong_to :national_park }

  before :each do
    @denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
    @katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
    @kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

    @triple = @denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
    @quadruple = @denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
    @double = @katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
    @single = @kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)
  end

  describe 'class methods' do
    describe '#is_loop?' do
      it 'can show only trails that are a loop' do
        expect(Trail.is_loop?).to eq([@double, @single])
      end
    end
  end
end
