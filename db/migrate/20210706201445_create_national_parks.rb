class CreateNationalParks < ActiveRecord::Migration[5.2]
  def change
    create_table :national_parks do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.integer :acreage
      t.boolean :seasonal
    end
  end
end
