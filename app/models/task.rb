class Task < ApplicationRecord
  belongs_to :plant
  validates :type, presence: true
  validates :frequency_in_days, presence: true
  validates :next_time, presence: true
  validates :done, presence: true
end
