class ChangeSuggestedSunlightTypeInPlants < ActiveRecord::Migration[7.1]
  def change
    change_column :plants, :suggested_sunlight, :string
  end
end
