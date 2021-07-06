class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.integer :length
      t.boolean :loop
    end
  end
end
