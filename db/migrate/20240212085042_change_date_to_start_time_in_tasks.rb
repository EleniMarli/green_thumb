class ChangeDateToStartTimeInTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :date, :start_time
    change_column :tasks, :start_time, :datetime
  end
end
