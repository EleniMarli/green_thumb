class AddHapinessToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :hapiness, :integer
  end
end
