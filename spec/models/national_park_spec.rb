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

    describe '::order_by_most_trails' do
      it 'can return the national parks by most trails' do
        @kenai_fjords.trails.create!(name: 'Five Lakes Trail', length: 5, is_loop: true)
        @denali.trails.create!(name: 'Six Lakes Trail', length: 6, is_loop: true)
        expect(NationalPark.order_by_most_trails).to eq([@denali, @kenai_fjords, @katmai])
      end
    end
  end

  describe 'instance methods' do
    describe '#trail_count' do
      it 'can return the number of trails associated with the national park' do
        expect(@denali.trail_count).to eq(2)
        expect(@katmai.trail_count).to eq(1)
        expect(@kenai_fjords.trail_count).to eq(1)
      end
    end

    describe '#sort_by_name' do
      it 'can sort the trails associated to the national park by name' do
        berry = @denali.trails.create!(name: 'Berry Trail', length: 4, is_loop: true)
        deer = @denali.trails.create!(name: 'Deer Trail', length: 8, is_loop: true)

        expect(@denali.sort_by_name).to eq([berry, deer, @quadruple, @triple])
      end
    end

    describe '#filter_by_length_greater_than' do
      it 'can return the trails of the national park with more than a given length' do
        expect(@denali.filter_by_length_greater_than(10)).to eq([@quadruple])
      end
    end
  end
end
