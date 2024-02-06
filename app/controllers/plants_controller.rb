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
    # url = "https://perenual.com/api/species-list?key=#{ENV['PERENUAL_KEY']}&q=#{user_input}"       https://perenual.com/api/species-list?key=sk-a2mI65c22ac7a792a3777&q=monstera
    # uri = URI(url)
    # res = Net::HTTP.get_response(uri)
    # parsed = JSON.parse(res.body)
    # @response_plants = parsed['data'][0..5]'

    # FAKE RESPONSE (PLEASE DON'T DELETE OR UNCOMMENT)
    @user_input = 'monstera'
    @response_plants = parsed[:data][0..5].map do |plant|
      [plant[:id], plant[:scientific_name].first]
    end
    @plant = Plant.new
  end

  def create
    plant_params
    raise

  end

  private

  def plant_params
    params.require(:plant).permit(:id)
  end
end
