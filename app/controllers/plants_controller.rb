require 'net/http'
require "uri"
require 'json'

class PlantsController < ApplicationController
  def search
    parsed = {
      "data": [
        {
          "id": 5257,
          "common_name": "Swiss cheese plant",
          "scientific_name": ["Monstera deliciosa"],
          "other_name": [],
          "cycle": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
          "watering": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
          "sunlight": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
          "default_image": {
            "license": 451,
            "license_name": "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication",
            "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
            "original_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "regular_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "medium_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "small_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "thumbnail": "https://perenual.com/storage/image/upgrade_access.jpg"
          }
        },
        {
          "id": 5258,
          "common_name": "variegated Swiss cheese plant",
          "scientific_name": ["Monstera deliciosa 'Variegata'"],
          "other_name": [],
          "cycle": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
          "watering": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
          "sunlight": "Upgrade Plans To Premium/Supreme - https://perenual.com/subscription-api-pricing. I'm sorry",
          "default_image": {
            "license": 451,
            "license_name": "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication",
            "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
            "original_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "regular_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "medium_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "small_url": "https://perenual.com/storage/image/upgrade_access.jpg",
            "thumbnail": "https://perenual.com/storage/image/upgrade_access.jpg"
          }
        }
      ],
      "to": 2,
      "per_page": 30,
      "current_page": 1,
      "from": 1,
      "last_page": 1,
      "total": 2
    }

    # WORKS (PLEASE DON'T DELETE OR UNCOMMENT)
    # @user_input = 'monstera'
    # url = "https://perenual.com/api/species-list?key=#{ENV['PERENUAL_KEY']}&q=#{user_input}"
    # uri = URI(url)
    # res = Net::HTTP.get_response(uri)
    # parsed = JSON.parse(res.body)
    # @response_plants = parsed['data'][0..5].map do |plant|
    #  [plant[:id], plant[:scientific_name].first]
    # end

    # FAKE RESPONSE (PLEASE DON'T DELETE OR UNCOMMENT)
    @user_input = 'monstera'
    @response_plants = parsed[:data][0..5].map do |plant|
      [plant[:id], plant[:scientific_name].first]
    end
    @plant = Plant.new
  end

  def create
    parsed =  {
      "id": 1,
      "common_name": "European Silver Fir",
      "scientific_name": [
          "Abies alba"
      ],
      "other_name": [
          "Common Silver Fir"
      ],
      "family": "",
      "origin": nil,
      "type": "tree",
      "dimensions": {
          "type": nil,
          "min_value": 1,
          "max_value": 1.5,
          "unit": "feet"
      },
      "cycle": "Perennial",
      "watering": "Frequent",
      "depth_water_requirement": {
          "unit": "mm",
          "value": "50"
      },
      "volume_water_requirement": {
          "unit": "feet",
          "value": "1"
      },
      "watering_period": "morning",
      "watering_general_benchmark": {
          "value": '5-7',
          "unit": "days"
      },
      "plant_anatomy": [
          "bark":"brown",
          "leaves":"green"
      ],
      "sunlight": [
          "Part shade"
      ],
      "pruning_month": [
          "March",
          "April"
      ],
      "pruning_count": {
          "amount": 1,
          "interval": "yearly"
      },
      "seeds": 0,
      "attracts":[
        "bees",
        "birds",
        "rabbits"
      ],
      "propagation":[
          "seed",
          "cutting"
      ],
      "hardiness": {
          "min": "7",
          "max": "7"
      },
      "hardiness_location": {
        "full_url": "https://perenual.com/api/hardiness-map-sample?map=h&key=sk-a2mI65c22ac7a792a3777",
        "full_iframe": "<iframe src='https://perenual.com/api/hardiness-map-sample?map=1-13&key=sk-a2mI65c22ac7a792a3777'
        width=1000 height=550 ></iframe>"
      },
      "flowers": true,
      "flowering_season": "Spring",
      "color": "",
      "sunlight": [
          "full sun",
          "part shade"
      ],
      "soil": [],
      "pest_susceptibility": nil,
      "cones": true,
      "fruits": false,
      "edible_fruit": false,
      "fruit_color": nil,
      "fruiting_season": nil,
      "harvest_season": nil,
      "harvest_method": "cutting",
      "leaf": true,
      "leaf_color": [
          "green"
      ],
      "edible_leaf": false,
      "growth_rate": "High",
      "maintenance": "Low",
      "medicinal": true,
      "poisonous_to_humans": false,
      "poisonous_to_pets": false,
      "drought_tolerant": false,
      "salt_tolerant": false,
      "thorny": false,
      "invasive": false,
      "rare": false,
      "rare_level": "3",
      "tropical": false,
      "cuisine": false,
      "indoor": false,
      "care_level": "Medium",
      "description": "Amazing garden plant that is sure to capture attention...",
      "default_image": {
        "image_id": 9,
        "license": 5,
        "license_name": "Attribution-ShareAlike License",
        "license_url": "https://creativecommons.org/licenses/by-sa/2.0/",
        "original_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/og/49255769768_df55596553_b.jpg",
        "regular_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/regular/49255769768_df55596553_b.jpg",
        "medium_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/medium/49255769768_df55596553_b.jpg",
        "small_url": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/small/49255769768_df55596553_b.jpg",
        "thumbnail": "https://perenual.com/storage/species_image/2_abies_alba_pyramidalis/thumbnail/49255769768_df55596553_b.jpg"
      }
    }
    api_id = plant_params['id']

    # FOR API
    # url = "https://perenual.com/api/species/details/#{api_id}?key=#{ENV['PERENUAL_KEY']}"
    # res = Net::HTTP.get_response(uri)
    # parsed = JSON.parse(res.body)

    sunlight =  case parsed[:sunlight].last.downcase
                when 'shade'
                  0
                when 'part shade'
                  1
                when 'full sun'
                  2
                end

    @plant = Plant.new(
      scientific_name: parsed[:scientific_name].first,
      suggested_watering_frequency_in_days: parsed[:watering_general_benchmark][:value][-2..-1].gsub!("-", "").to_i, # I ASSUMED 5-7 IS A STRING AND TOOK THE LAST TWO DIGITS HOPING FOR THE BEST
      suggested_sunlight: sunlight, # sunlight appears as key twice, i believe the second gets chosen, I chose last from its array for no particular reason
      description: parsed[:description],
      care_level: parsed[:care_level].downcase,
      suggested_fertilizing_frequency_in_days: 42,
      actual_sun_exposure: sunlight, # HERE I ASSUME IT MATCHES THE SUGGESTED ####
      image_url: parsed[:default_image][:original_url],
      happiness: 1,
      user: current_user
    )

    redirect_to plant_path(@path) if @plant.save!
  end

  private

  def plant_params
    params.require(:plant).permit(:id)
  end

end
