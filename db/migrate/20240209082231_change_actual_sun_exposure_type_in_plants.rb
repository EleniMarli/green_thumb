class ChangeActualSunExposureTypeInPlants < ActiveRecord::Migration[7.1]
  def change
    change_column :plants, :actual_sun_exposure, :string
  end
end
