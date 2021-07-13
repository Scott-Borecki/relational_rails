class Trail < ApplicationRecord
  belongs_to :national_park

  def self.loop_only
    where(is_loop: true)
  end
end
