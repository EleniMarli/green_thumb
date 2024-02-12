class Task < ApplicationRecord
  belongs_to :plant
  validates :task_type, presence: true
  validates :frequency_in_days, presence: true
  validates :start_time, presence: true
  validates :done, inclusion: [true, false]
  validates :shown, inclusion: [true, false]
  validates :delayed, inclusion: [true, false]
end
