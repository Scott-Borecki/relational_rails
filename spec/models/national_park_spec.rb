require 'rails_helper'

describe NationalPark, type: :model do
  it { should have_many :trails }
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
    describe '::order_by_most_recent' do
      it 'can return the national parks by most recently created' do
        expect(NationalPark.order_by_most_recent).to eq([@kenai_fjords, @katmai, @denali])
      end
    end
  end
end
