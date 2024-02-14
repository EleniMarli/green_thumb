class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :notification
  before_action :set_start_of_week

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def set_start_of_week
    Date.beginning_of_week = :monday
  end
end
