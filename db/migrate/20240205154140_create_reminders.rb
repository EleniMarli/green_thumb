class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.string :alarm_time, default: '11:00:00'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
