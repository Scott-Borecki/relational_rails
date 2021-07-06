class CreateCampgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :max_nights
      t.boolean :reservation_required
    end
  end
end
