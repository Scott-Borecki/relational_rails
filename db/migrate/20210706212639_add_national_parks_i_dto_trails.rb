class AddNationalParksIDtoTrails < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :national_park_id, :integer
  end
end
