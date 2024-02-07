class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @plants = Plant.where(user: current_user)
    @user = current_user
  end
end
