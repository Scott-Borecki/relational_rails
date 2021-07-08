require 'rails_helper'

describe Trail, type: :model do
  it { should belong_to :national_park }
  describe 'instance methods'
end
