require 'rails_helper'

RSpec.describe Campground do
  describe 'relationships' do
    it { should have_many :campsites }
  end
end
