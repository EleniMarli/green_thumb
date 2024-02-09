# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Plant.destroy_all
User.destroy_all
Task.destroy_all

user = User.create!(
  name: "Rosy",
  email: "rosy@rosy.com",
  password: "123456"
)

plant1 = Plant.create!(
  scientific_name: 'Ficus elastica',
  nickname: 'Rubby',
  suggested_watering_frequency_in_days: 7,
  suggested_sunlight: 'full sun',
  description: 'The rubber plant is a popular houseplant known for its large, glossy leaves.',
  care_level: 'easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'part shade',
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'living room',
  happiness: 2
)

 # WATERING

Task.create!(
  task_type: 'watering',
  frequency_in_days: 7,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant1
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 7,
  date: (Date.today + 7),
  done: false,
  shown: false,
  delayed: false,
  plant: plant1
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 7,
  date: (Date.today + (2 * 7)),
  done: false,
  shown: false,
  delayed: false,
  plant: plant1
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant1
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant1
)

plant2 = Plant.create!(
  scientific_name: 'Sansevieria trifasciata',
  nickname: 'Snaky',
  suggested_watering_frequency_in_days: 14,
  suggested_sunlight: 'full sun',
  description: 'The snake plant is a hardy indoor plant that can tolerate low light and infrequent watering.',
  care_level: 'easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'shade',
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'bedroom',
  happiness: 1
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 14,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 14,
  date: (Date.today + 14),
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 14,
  date: (Date.today + (2 * 14)),
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

plant3 = Plant.create!(
  scientific_name: 'Monstera deliciosa',
  nickname: 'Swissy',
  suggested_watering_frequency_in_days: 10,
  suggested_sunlight: 'part shade',
  description: 'The Monstera deliciosa is a striking tropical plant known for its large, fenestrated leaves.',
  care_level: 'moderate',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'full sun',
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'kitchen',
  happiness: 0
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  date: (Date.today + 10),
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  date: (Date.today + (2 * 10)),
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

plant4 = Plant.create!(
  scientific_name: 'Zamioculcas zamiifolia',
  nickname: 'ZZ',
  suggested_watering_frequency_in_days: 21,
  suggested_sunlight: 'part shade',
  description: 'The ZZ plant is a low-maintenance houseplant with glossy, dark green leaves.',
  care_level: 'easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'shade',
  user: user,
  image_url: 'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'office',
  happiness: 2
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 21,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 21,
  date: (Date.today + 21),
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 21,
  date: (Date.today + (2 * 21)),
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  date: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)
