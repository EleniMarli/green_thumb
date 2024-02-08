class RenameNextDateToDate < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :next_date, :date
  end
end
