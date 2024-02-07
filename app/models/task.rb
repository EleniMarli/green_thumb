class Task < ApplicationRecord
  belongs_to :plant
  validates :task_type, presence: true
  validates :frequency_in_days, presence: true
  validates :next_date, presence: true
  validates :last_date, presence: true
end
