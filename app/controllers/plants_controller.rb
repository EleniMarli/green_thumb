
require 'net/http'
require "uri"

class PlantsController < ApplicationController

  def search
    user_input = 'monstera'
    # url = "https://perenual.com/api/species-list?key=#{ENV.fetch(PERENUAL_KEY)}&q=#{user_input}"
    url = "https://perenual.com/api/species-list?key=sk-a2mI65c22ac7a792a3777&q=#{user_input}"
    uri = URI(url)
    #params = { limit: 1 }
    #uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    @res = res.body
    # http.use_ssl = true
    # request = Net::HTTP::get.new(uri.path, { 'Content-Type' => 'application/json' })
    # request.body = {}
    # response = http.request(request)
    # body = JSON.parse(response.body)
    # puts(response)
  end
end
