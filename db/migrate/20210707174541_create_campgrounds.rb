class CreateCampgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.boolean :reservation_allowed
      t.integer :max_nights

      t.timestamps
    end
  end
end
