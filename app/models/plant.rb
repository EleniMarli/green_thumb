class Plant < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :scientific_name, presence: true
  validates :suggested_watering_frequency_in_days, presence: true
  validates :suggested_sunlight, presence: true
  # enum suggested_sunlight: { ..... : 0, ....... : 1, ........ : 2 }
  validates :suggested_fertilizing_frequency_in_days, presence: true
  validates :description, presence: true
  validates :care_level, presence: true
  validates :actual_sun_exposure, presence: true
  # enum actual_sun_exposure: { ..... : 0, ....... : 1, ........ : 2 }
  validates :image_url, presence: true
  validates :happiness, presence: true
  # enum happiness: { 'sad' : 0, 'medium' : 1, 'happy' : 2 }
end
