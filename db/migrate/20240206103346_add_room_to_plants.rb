class AddRoomToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :room, :string
  end
end
