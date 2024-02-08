class AddShownToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :shown, :boolean, default: false
  end
end
