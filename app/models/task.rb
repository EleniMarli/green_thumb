class Task < ApplicationRecord
  belongs_to :plant
  validates :task_type, presence: true
  validates :frequency_in_days, presence: true
  validates :date, presence: true
end
