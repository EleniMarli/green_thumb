class AddLastDateToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :last_date, :date
  end
end
