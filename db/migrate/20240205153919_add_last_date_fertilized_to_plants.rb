class AddLastDateFertilizedToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :last_date_fertilized, :date
  end
end
