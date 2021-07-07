class CreateNationalParks < ActiveRecord::Migration[5.2]
  def change
    create_table :national_parks do |t|
      t.string :name
      t.integer :acreage
      t.boolean :is_seasonal

      t.timestamps
    end
  end
end
