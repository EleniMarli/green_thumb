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
  nickname: 'My ficus',
  suggested_watering_frequency_in_days: 7,
  suggested_sunlight: 'full sun',
  description: 'The rubber plant is a popular houseplant known for its large, glossy leaves.',
  care_level: 'easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'shade',
  user: user,
  image_url: 'https://perenual.com/storage/species_image/2961_ficus_elastica/og/533092219_8da73ba0d2_b.jpg',
  room: 'living room',
  happiness: 2
)

 # WATERING

Task.create!(
  task_type: 'watering',
  frequency_in_days: 7,
  start_time: Date.today - 30,
  done: true,
  shown: true,
  delayed: false,
  plant: plant1
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 7,
  start_time: (Date.today + 7) - 30,
  done: true,
  shown: true,
  delayed: false,
  plant: plant1
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 7,
  start_time: (Date.today + (2 * 7)) - 30,
  done: true,
  shown: true,
  delayed: true,
  plant: plant1
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: Date.yesterday,
  done: true,
  shown: true,
  delayed: true,
  plant: plant1
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: (Date.yesterday + 42),
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
  image_url: 'https://images.unsplash.com/photo-1565626929866-e11c64e607cf?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  room: 'bedroom',
  happiness: 1
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 14,
  start_time: Date.today,
  done: false,
  shown: false,
  delayed: true,
  plant: plant2
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 14,
  start_time: (Date.today + 14),
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 14,
  start_time: (Date.today + 14 + 14),
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: Date.today,
  done: false,
  shown: false,
  delayed: true,
  plant: plant2
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant2
)

plant5 = Plant.create!(
  scientific_name: 'Monstera deliciosa variegeta',
  nickname: 'Spotty',
  suggested_watering_frequency_in_days: 10,
  suggested_sunlight: 'part shade',
  description: 'The Monstera deliciosa variegata is a striking tropical plant known for its large, fenestrated leaves.',
  care_level: 'medium',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'full sun',
  user: user,
  image_url: 'https://perenual.com/storage/species_image/5257_monstera_deliciosa/og/4630938853_623dc33137_b.jpg',
  room: 'kitchen',
  happiness: 0
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  start_time: Date.today - 22,
  done: true,
  shown: true,
  delayed: false,
  plant: plant5
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  start_time: (Date.today - 22 + 10),
  done: true,
  shown: true,
  delayed: false,
  plant: plant5
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  start_time: (Date.today - 22 + 20),
  done: true,
  shown: true,
  delayed: false,
  plant: plant5
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant5
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant5
)

user1 = User.create!(
  name: "Lilly",
  email: "lilly@lilly.com",
  password: "123456"
)

plant3 = Plant.create!(
  scientific_name: 'Monstera deliciosa',
  nickname: 'Big girl',
  suggested_watering_frequency_in_days: 10,
  suggested_sunlight: 'part shade',
  description: 'The Monstera deliciosa is a striking tropical plant known for its large, fenestrated leaves.',
  care_level: 'medium',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'full sun',
  user: user1,
  image_url: 'https://perenual.com/storage/species_image/5257_monstera_deliciosa/og/4630938853_623dc33137_b.jpg',
  room: 'kitchen',
  happiness: 0
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  start_time: Date.today - 22,
  done: true,
  shown: true,
  delayed: false,
  plant: plant3
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  start_time: (Date.today - 22 + 10),
  done: true,
  shown: true,
  delayed: false,
  plant: plant3
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 10,
  start_time: (Date.today - 22 + 20),
  done: true,
  shown: true,
  delayed: false,
  plant: plant3
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant3
)

plant4 = Plant.create!(
  scientific_name: 'Zamioculcas zamiifolia',
  nickname: 'Whyudothis',
  suggested_watering_frequency_in_days: 21,
  suggested_sunlight: 'part shade',
  description: 'The ZZ plant is a low-maintenance houseplant with glossy, dark green leaves.',
  care_level: 'easy',
  suggested_fertilizing_frequency_in_days: 42,
  actual_sun_exposure: 'shade',
  user: user1,
  image_url: 'https://plantsmith.co.uk/wp-content/uploads/2020/08/AdobeStock_363636424_zz-plant_1200px.jpg',
  room: 'office',
  happiness: 0
)

 # WATERING

 Task.create!(
  task_type: 'watering',
  frequency_in_days: 21,
  start_time: Date.today,
  done: false,
  shown: false,
  delayed: true,
  plant: plant4
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 21,
  start_time: (Date.today + 21),
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

Task.create!(
  task_type: 'watering',
  frequency_in_days: 21,
  start_time: (Date.today + (2 * 21)),
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

# FERTILIZING

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: Date.today,
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)

Task.create!(
  task_type: 'fertilizing',
  frequency_in_days: 42,
  start_time: (Date.today + 42),
  done: false,
  shown: false,
  delayed: false,
  plant: plant4
)
