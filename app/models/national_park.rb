class NationalPark < ApplicationRecord
  has_many :trails

  def self.order_by_most_recent
    order(created_at: :desc)
  end

  def trail_count
    trails.length
  end

  def sort_by_name
    trails.order(name: :asc)
  end
end
