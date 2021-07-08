require 'rails_helper'

RSpec.describe Campsite do
  describe 'relationship' do
    it { should belong_to :campground }
  end
end
