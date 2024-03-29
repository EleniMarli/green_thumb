require 'net/http'
require "uri"
require 'json'

class PlantsController < ApplicationController
  def show
    @plant = Plant.find(params[:id])
    update_happiness(@plant)
    last_watered = @plant.tasks.where(task_type: 'watering', done: true).order(start_time: :desc).first
    @last_watered = last_watered.start_time.strftime("%d %b %Y") if last_watered!=nil
    last_fertilized = @plant.tasks.where(task_type: 'fertilizing', done: true).order(start_time: :desc).first
    @last_fertilized = last_fertilized.start_time.strftime("%d %b %Y") if last_fertilized!=nil
  end

  def update_happiness(plant)
    sun_happiness = calc_sun_happiness(plant)
    water_happiness = calc_task_happiness(plant, 'watering')
    fert_happiness = calc_task_happiness(plant, 'fertilizing')
    overall_happiness = (water_happiness * 0.4) + (sun_happiness * 0.3) + (fert_happiness * 0.3)

    happiness_boundaries = case plant.care_level
                           when 'easy' then [0.2, 0.5]
                           when 'medium' then [0.3, 0.6]
                           when 'hard' then [0.4, 0.7]
                           else
                             raise "Plant care level not expected"
                           end

    if overall_happiness < happiness_boundaries[0]
      plant.update(happiness: 0)
    elsif overall_happiness < happiness_boundaries[1]
      plant.update(happiness: 1)
    else
      plant.update(happiness: 2)
    end
  end

  # RETURNS STH BETWEEN 0 AND 1
  def calc_task_happiness(plant, type)
    delayed_tasks = plant.tasks.where(task_type: type, delayed: true).count.to_f
    tasks_until_today = plant.tasks.where(task_type: type).where("start_time <= ?", Date.today).count.to_f
    [1 - (delayed_tasks / tasks_until_today), 0].max
  end

  # RETURNS STH BETWEEN 0 AND 1
  def calc_sun_happiness(plant)
    sun_hash = {
      'shade' => 0,
      'part shade' => 1,
      'full sun' => 2
    }
    case (sun_hash[plant.suggested_sunlight] - sun_hash[plant.actual_sun_exposure]).abs
    when 0 then 1
    when 1 then 0.5
    when 2 then 0
    else
      raise "Sun happiness not 0,1,2"
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params_for_update)
      redirect_to plant_path(@plant), notice: 'Plant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to dashboard_path(current_user)
  end

  def search
    # parsed = {
    #   "data": [
    #     {
    #       "id": 5257,
    #       "common_name": "Swiss cheese plant",
    #       "scientific_name": ["Monstera deliciosa"],
    #       "other_name": [],
    #       "cycle": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
    #       "watering": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
    #       "sunlight": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
    #       "default_image": {
    #         "license": 451,
    #         "license_name": "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication",
    #         "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
    #         "original_url": "https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3",
    #         "regular_url": "https://perenual.com/storage/image/upgrade_access.jpg",
    #         "medium_url": "https://perenual.com/storage/image/upgrade_access.jpg",
    #         "small_url": "https://perenual.com/storage/image/upgrade_access.jpg",
    #         "thumbnail": "https://perenual.com/storage/image/upgrade_access.jpg"
    #       }
    #     },
    #     {
    #       "id": 5258,
    #       "common_name": "variegated Swiss cheese plant",
    #       "scientific_name": ["Monstera deliciosa 'Variegata'"],
    #       "other_name": [],
    #       "cycle": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
    #       "watering": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
    #       "sunlight": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
    #       "default_image": {
    #         "license": 451,
    #         "license_name": "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication",
    #         "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
    #         "original_url": "https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3",
    #         "regular_url": "https://perenual.com/storage/image/upgrade_access.jpg",
    #         "medium_url": "https://perenual.com/storage/image/upgrade_access.jpg",
    #         "small_url": "https://perenual.com/storage/image/upgrade_access.jpg",
    #         "thumbnail": "https://perenual.com/storage/image/upgrade_access.jpg"
    #       }
    #     }
    #   ],
    #   "to": 2,
    #   "per_page": 30,
    #   "current_page": 1,
    #   "from": 1,
    #   "last_page": 1,
    #   "total": 2
    # }

    # WORKS (PLEASE DON'T DELETE OR UNCOMMENT)
    @user_input = params[:query]

    if !@user_input.nil? && @user_input != ''
      encoded_user_input = URI.encode_www_form_component(@user_input)
      url = "https://perenual.com/api/species-list?key=#{ENV['PERENUAL_KEY']}&q=#{encoded_user_input}"
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      parsed = JSON.parse(res.body)

      # @response_plants = parsed['data'][0..5].map do |plant|
      #  [plant[:id], plant[:scientific_name].first]
      # end

      # FAKE RESPONSE (PLEASE DON'T DELETE OR UNCOMMENT)
      # @user_input = params[:query]
      free_access_plants = parsed['data'][0..5].reject { |plant| plant["id"] > 3000 }
      @response_plants = free_access_plants.map do |plant|
        image = ""
        if plant['default_image'] == nil # || plant['default_image'] == 'https://perenual.com/storage/image/upgrade_access.jpg'
          image = 'https://perenual.com/storage/image/missing_image.jpg'   #### MAYBE REPLACE ??
        else
          image = plant['default_image']['original_url']
        end
        [plant['id'], plant['scientific_name'].first, image] # if plant['id'] <= 3000
      end
    end
    @plant = Plant.new
  end

  def create
    # parsed =  {
    #   "id": 1,
    #   "common_name": "European Silver Fir",
    #   "scientific_name": [
    #       "Abies alba"
    #   ],
    #   "other_name": [
    #       "Common Silver Fir"
    #   ],
    #   "family": "",
    #   "origin": nil,
    #   "type": "tree",
    #   "dimensions": {
    #       "type": nil,
    #       "min_value": 1,
    #       "max_value": 1.5,
    #       "unit": "feet"
    #   },
    #   "cycle": "Perennial",
    #   "watering": "Frequent",
    #   "depth_water_requirement": {
    #       "unit": "mm",
    #       "value": "50"
    #   },
    #   "volume_water_requirement": {
    #       "unit": "feet",
    #       "value": "1"
    #   },
    #   "watering_period": "morning",
    #   "watering_general_benchmark": {
    #       "value": '5-7',
    #       "unit": "days"
    #   },
    #   "plant_anatomy": [
    #       "bark":"brown",
    #       "leaves":"green"
    #   ],
    #   "sunlight": [
    #       "Part shade"
    #   ],
    #   "pruning_month": [
    #       "March",
    #       "April"
    #   ],
    #   "pruning_count": {
    #       "amount": 1,
    #       "interval": "yearly"
    #   },
    #   "seeds": 0,
    #   "attracts":[
    #     "bees",
    #     "birds",
    #     "rabbits"
    #   ],
    #   "propagation":[
    #       "seed",
    #       "cutting"
    #   ],
    #   "hardiness": {
    #       "min": "7",
    #       "max": "7"
    #   },
    #   "hardiness_location": {
    #     "full_url": "https://perenual.com/api/hardiness-map-sample?map=h&key=sk-a2mI65c22ac7a792a3777",
    #     "full_iframe": "<iframe src='https://perenual.com/api/hardiness-map-sample?map=1-13&key=sk-a2mI65c22ac7a792a3777'
    #     width=1000 height=550 ></iframe>"
    #   },
    #   "flowers": true,
    #   "flowering_season": "Spring",
    #   "color": "",
    #   "sunlight": [
    #       "full sun",
    #       "part shade"
    #   ],
    #   "soil": [],
    #   "pest_susceptibility": nil,
    #   "cones": true,
    #   "fruits": false,
    #   "edible_fruit": false,
    #   "fruit_color": nil,
    #   "fruiting_season": nil,
    #   "harvest_season": nil,
    #   "harvest_method": "cutting",
    #   "leaf": true,
    #   "leaf_color": [
    #       "green"
    #   ],
    #   "edible_leaf": false,
    #   "growth_rate": "High",
    #   "maintenance": "Low",
    #   "medicinal": true,
    #   "poisonous_to_humans": false,
    #   "poisonous_to_pets": false,
    #   "drought_tolerant": false,
    #   "salt_tolerant": false,
    #   "thorny": false,
    #   "invasive": false,
    #   "rare": false,
    #   "rare_level": "3",
    #   "tropical": false,
    #   "cuisine": false,
    #   "indoor": false,
    #   "care_level": "Medium",
    #   "description": "Amazing garden plant that is sure to capture attention...",
    #   "default_image": {
    #     "image_id": 9,
    #     "license": 5,
    #     "license_name": "Attribution-ShareAlike License",
    #     "license_url": "https://creativecommons.org/licenses/by-sa/2.0/",
    #     "original_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/og/49255769768_df55596553_b.jpg",
    #     "regular_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/regular/49255769768_df55596553_b.jpg",
    #     "medium_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/medium/49255769768_df55596553_b.jpg",
    #     "small_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/small/49255769768_df55596553_b.jpg",
    #     "thumbnail": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/thumbnail/49255769768_df55596553_b.jpg"
    #   }
    # }
    api_id = plant_params['id']
    if api_id != ""
      # FOR API
      url = "https://perenual.com/api/species/details/#{api_id}?key=#{ENV['PERENUAL_KEY']}"
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      parsed = JSON.parse(res.body)

      sunlight = parsed['sunlight'].last.downcase
      sunlight = 'part shade' unless ['shade', 'part shade', 'full sun'].include?(sunlight)

      image = ""
      if parsed['default_image'] == nil
        image = 'https://perenual.com/storage/image/missing_image.jpg'
      else
        image = parsed['default_image']['original_url']
      end

      care = parsed['care_level']
      if parsed['care_level'] == nil
        care = 'medium'
      elsif care.downcase == 'moderate'
        care = 'medium'
      elsif care.downcase == 'low'
        care = 'easy'
      elsif care.downcase == 'high'
        care = 'hard'
      end

      water_fr = parsed['watering_general_benchmark']['value']
      water_fr = "7-10" if water_fr.nil?

      @plant = Plant.new(
        scientific_name: parsed['scientific_name'].first,
        suggested_watering_frequency_in_days: water_fr[-2..-1].gsub("-", "").to_i, # I ASSUMED 5-7 IS A STRING AND TOOK THE LAST TWO DIGITS HOPING FOR THE BEST
        suggested_sunlight: sunlight, # sunlight appears as key twice, i believe the second gets chosen, I chose last from its array for no particular reason
        description: parsed['description'],
        care_level: care.downcase,
        suggested_fertilizing_frequency_in_days: 42,
        actual_sun_exposure: sunlight, # HERE I ASSUME IT MATCHES THE SUGGESTED ####
        image_url: image,
        happiness: 1,
        user: current_user
      )

      if @plant.save!
        # WATERING

        Task.create!(
          task_type: 'watering',
          frequency_in_days: @plant.suggested_watering_frequency_in_days,
          start_time: Date.today,
          done: false,
          shown: false,
          delayed: false,
          plant: @plant
        )

        Task.create!(
          task_type: 'watering',
          frequency_in_days: @plant.suggested_watering_frequency_in_days,
          start_time: (Date.today + @plant.suggested_watering_frequency_in_days),
          done: false,
          shown: false,
          delayed: false,
          plant: @plant
        )

        Task.create!(
          task_type: 'watering',
          frequency_in_days: @plant.suggested_watering_frequency_in_days,
          start_time: (Date.today + (2 * @plant.suggested_watering_frequency_in_days)),
          done: false,
          shown: false,
          delayed: false,
          plant: @plant
        )

        # FERTILIZING

        Task.create!(
          task_type: 'fertilizing',
          frequency_in_days: @plant.suggested_fertilizing_frequency_in_days,
          start_time: Date.today,
          done: false,
          shown: false,
          delayed: false,
          plant: @plant
        )

        Task.create!(
          task_type: 'fertilizing',
          frequency_in_days: @plant.suggested_fertilizing_frequency_in_days,
          start_time: (Date.today + @plant.suggested_fertilizing_frequency_in_days),
          done: false,
          shown: false,
          delayed: false,
          plant: @plant
        )

        redirect_to root_path
      end
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:id)
  end

  def plant_params_for_update
    params[:plant][:nickname] = nil if params[:plant][:nickname].blank?
    params.require(:plant).permit(:nickname, :actual_sun_exposure, :room, :photo)

  end
end
