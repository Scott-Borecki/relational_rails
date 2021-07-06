class CreateCampsites < ActiveRecord::Migration[5.2]
  def change
    create_table :campsites do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :overnight_fee
      t.boolean :tent_only
    end
  end
end
