class Campsite < ApplicationRecord
  belongs_to :campground

  def self.tent_only
    where(tent_only: true)
  end
end
