require 'rails_helper'

RSpec.describe Campsite do
  describe 'relationship' do
    it { should belong_to :campground }
  end

  before :each do
    @sunset_point = Campground.create!(name: 'Sunset Point Campground', reservation_allowed: false, max_nights: 7)
    @cherry_creek = Campground.create!(name: 'Cherry Creek Campground', reservation_allowed: true, max_nights: 14)
    @chatfield = Campground.create!(name: 'Chatfield Campground', reservation_allowed: true, max_nights: 14)
    @site_15 = @sunset_point.campsites.create!(name: 'Site 15', tent_only: true, overnight_fee: 26)
    @site_18 = @sunset_point.campsites.create!(name: 'Site 18', tent_only: false, overnight_fee: 52)
    @cottonwood_111= @cherry_creek.campsites.create!(name: 'Cottonweood Grove Site 111', tent_only: false, overnight_fee: 28)
    @abilene_10= @cherry_creek.campsites.create!(name: 'Abilene Site 10', tent_only: false, overnight_fee: 41)
    @a_001 = @chatfield.campsites.create!(name: 'A Loop Site 1', tent_only: false, overnight_fee: 41)
    @group_a = @chatfield.campsites.create!(name: 'Group Site A', tent_only: false, overnight_fee: 200)
  end

  describe 'class methods' do
    describe '::tent_only' do
      it 'returns campsites that are tent only' do
        expect(Campsite.tent_only).to eq([@site_15])
      end
    end
  end
end
