class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :length
      t.boolean :is_loop
      t.references :national_park, foreign_key: true

      t.timestamps
    end
  end
end
