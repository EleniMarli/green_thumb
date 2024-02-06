class RenameHapinessToHappinessInPlants < ActiveRecord::Migration[7.1]
  def change
    rename_column :plants, :hapiness, :happiness
  end
end
