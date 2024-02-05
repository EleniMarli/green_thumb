class AddLastDateWateredToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :last_date_watered, :date
  end
end
