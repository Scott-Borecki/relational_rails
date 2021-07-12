class Trail < ApplicationRecord
  belongs_to :national_park

  def self.is_loop?
    self.where("is_loop = 'true'")
  end
end
