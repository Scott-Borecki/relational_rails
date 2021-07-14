class Campground < ApplicationRecord
  has_many :campsites, :dependent => :destroy

  def self.order_by_most_campsites
    left_joins(:campsites).group(:id).order(Arel.sql('COUNT(campsites.id) DESC'))
  end

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
