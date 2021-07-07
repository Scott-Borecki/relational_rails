class CreateCampsites < ActiveRecord::Migration[5.2]
  def change
    create_table :campsites do |t|
      t.string :name
      t.boolean :tent_only
      t.integer :overnight_fee

      t.timestamps
    end
  end
end
