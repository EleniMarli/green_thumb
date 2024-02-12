class Plant < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_room,
    against: [ :scientific_name, :nickname, :room ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :scientific_name, presence: true
  validates :nickname, length: { maximum: 15 }
  validates :room, length: { maximum: 15 }
  validates :suggested_watering_frequency_in_days, presence: true
  validates :suggested_sunlight, presence: true
  validates :suggested_sunlight, format: {with: /[a-zA-Z]/}
  validates :suggested_fertilizing_frequency_in_days, presence: true
  validates :description, presence: true
  validates :care_level, presence: true
  validates :actual_sun_exposure, presence: true
  validates :actual_sun_exposure, format: {with: /[a-zA-Z]/}
  validates :image_url, presence: true
  validates :happiness, presence: true
  has_one_attached :photo
end
