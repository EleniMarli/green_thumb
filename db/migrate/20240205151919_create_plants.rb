class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :scientific_name
      t.string :nickname
      t.integer :suggested_watering_frequency_in_days
      t.integer :suggested_sunlight
      t.text :description
      t.string :care_level
      t.integer :suggested_fertilizing_frequency_in_days, default: 42
      t.integer :actual_sun_exposure
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
