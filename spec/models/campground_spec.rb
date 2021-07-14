require 'rails_helper'

RSpec.describe Campground do
  describe 'relationships' do
    it { should have_many :campsites }
  end

  before(:each) do
    @sunset_point = Campground.create!(name: 'Sunset Point Campground', reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: 'Cherry Creek Campground', reservation_allowed: true, max_nights: 14)
    @chatfield = Campground.create!(name: 'Chatfield Campground', reservation_allowed: true, max_nights: 14)
    @site_15 = @sunset_point.campsites.create!(name: 'Site 15', tent_only: true, overnight_fee: 26)
    @cottonwood_111= @cherry_creek.campsites.create!(name: 'Cottonwood Grove Site 111', tent_only: false, overnight_fee: 28)
    @abilene_10= @cherry_creek.campsites.create!(name: 'Abilene Site 10', tent_only: false, overnight_fee: 41)
  end

  describe 'class methods' do
    describe '::order_by_recently_created' do
      it 'orders campgrounds by recently created' do
        expect(Campground.order_by_recently_created).to eq([@chatfield, @cherry_creek, @sunset_point])
      end
    end

    describe '::order_by_most_campsites' do
      it 'orders campgrounds by most campsites' do
        expect(Campground.order_by_most_campsites).to eq([@cherry_creek, @sunset_point, @chatfield])
      end
    end
  end

  describe 'instance methods' do
    describe '#campsite_count' do
      it 'returns campsite count' do
        site_18 = @sunset_point.campsites.create!(name: 'Site 18', tent_only: false, overnight_fee: 52)

        expect(@sunset_point.campsite_count).to eq(2)
      end
    end

    describe '#order_campsites_by_name' do
      it 'can order campsites by name' do
        site_18 = @sunset_point.campsites.create!(name: 'Site 18', tent_only: false, overnight_fee: 52)

        expect(@sunset_point.order_campsites_by_name).to eq([@site_15, site_18])
      end
    end

    describe '#overnight_fee_greater_than' do
      it 'can return campsites with overnight fee greater than amount given' do
        site_18 = @sunset_point.campsites.create!(name: 'Site 18', tent_only: false, overnight_fee: 52)

        expect(@sunset_point.overnight_fee_greater_than(30)).to eq([site_18])
      end
    end
  end
end
