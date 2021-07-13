class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_by_recently_created
    order(created_at: :desc)
  end
end
