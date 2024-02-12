class ChangeStartTimeColumnTypeInTasks < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :start_time, :date
  end
end
