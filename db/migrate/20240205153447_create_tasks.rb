class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.integer :frequency_in_days
      t.date :next_time
      t.string :type
      t.boolean :done
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
