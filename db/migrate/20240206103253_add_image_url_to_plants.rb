class AddImageUrlToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :image_url, :string
  end
end
