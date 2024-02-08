class RemoveLastDateFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :last_date, :date
  end
end
