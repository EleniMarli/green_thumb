class RemoveLastDateWateredfromPlants < ActiveRecord::Migration[7.1]
  def change
    remove_column :plants, :last_date_watered, :date
  end
end
