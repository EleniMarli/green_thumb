# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(
  name: "Rosy",
  email: "rosy@email.com",
  password: "123456"
)

Plant.create!(
  scientific_name: 'Ficus elastica',
  nickname: 'Rubby',
  suggested_watering_frequency_in_days: 7,
  suggested_sunlight: 2,
  description: 'The rubber plant is a popular houseplant known for its large, glossy leaves.',
  care_level: 'Easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 0,
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'Living room',
  hapiness: 2
)

Plant.create!(
  scientific_name: 'Sansevieria trifasciata',
  nickname: 'Snaky',
  suggested_watering_frequency_in_days: 14,
  suggested_sunlight: 2,
  description: 'The snake plant is a hardy indoor plant that can tolerate low light and infrequent watering.',
  care_level: 'Easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 0,
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'Bedroom',
  hapiness: 1
)

Plant.create!(
  scientific_name: 'Monstera deliciosa',
  nickname: 'Swissy',
  suggested_watering_frequency_in_days: 10,
  suggested_sunlight: 1,
  description: 'The Monstera deliciosa is a striking tropical plant known for its large, fenestrated leaves.',
  care_level: 'Moderate',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 0,
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'Sunroom',
  hapiness: 0
)

Plant.create!(
  scientific_name: 'Zamioculcas zamiifolia',
  nickname: 'ZZ',
  suggested_watering_frequency_in_days: 21,
  suggested_sunlight: 1,
  description: 'The ZZ plant is a low-maintenance houseplant with glossy, dark green leaves.',
  care_level: 'Easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 0,
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'Office',
  hapiness: 2
)

Plant.create!(
  scientific_name: 'Epipremnum aureum',
  nickname: 'Golden',
  suggested_watering_frequency_in_days: 7,
  suggested_sunlight: 0,
  description: 'The golden pothos is a popular trailing houseplant known for its heart-shaped leaves and air-purifying properties.',
  care_level: 'Hard',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 0,
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'Kitchen',
  hapiness: 1
)
