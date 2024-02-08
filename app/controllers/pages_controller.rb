class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :notify_user, only: [:home]

  def home
    @plants = Plant.where(user: current_user)
    @user = current_user
  end

  private

  def notify_user
    tasks = Task.where('next_date >= ? AND done = ?', Date.today, false)
    unless tasks.empty?
      flash.now[:notification] = "You have #{tasks.count} pending task(s)"
      tasks.update_all(done: true)
    end
  end
end
