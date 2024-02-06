class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @plants = Plant.all
    @user = current_user
  end
end
