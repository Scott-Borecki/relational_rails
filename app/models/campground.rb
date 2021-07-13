class Campground < ApplicationRecord
  has_many :campsites

  def campsite_count
    campsites.length
  end

  def order_campsites_by_name
    campsites.order(:name)
  end

  def overnight_fee_greater_than(amount)
    campsites.where('overnight_fee > ?', amount)
  end
end
