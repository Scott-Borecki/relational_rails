class NationalPark < ApplicationRecord
  has_many :trails, :dependent => :destroy

  def self.order_by_most_trails
    joins(:trails).
    group(:id).
    order(Arel.sql('count(trails.id) desc'))
  end

  def trail_count
    trails.length
  end

  def sort_by_name
    trails.order(name: :asc)
  end

  def filter_by_length_greater_than(length)
    trails.where('length > ?', length)
  end
end
