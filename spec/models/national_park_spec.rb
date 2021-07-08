require 'rails_helper'

describe NationalPark, type: :model do
  it { should have_many :trails }
end
