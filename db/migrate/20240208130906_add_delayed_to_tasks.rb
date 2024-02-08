class AddDelayedToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :delayed, :boolean, default: false
  end
end
