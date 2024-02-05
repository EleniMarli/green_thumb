class RenameNextTimeInTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :next_time, :next_date
  end
end
