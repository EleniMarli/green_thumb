class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :notify_user, only: [:dashboard]

  def home
    redirect_to :dashboard unless current_user.nil?
  end

  def dashboard
    @plants = Plant.where(user: current_user)
  end

  def helper
  end

  def calendar

  end

  private

  def notify_user
    tasks = Task.where('date = ? AND shown = ? AND done = ?', Date.today, false, false)

    unless tasks.empty?
      flash.now[:notification] = "Hi #{current_user.name}, today you have #{tasks.count} pending task(s)! 🔔"
      tasks.update_all(shown: true)
    end
  end
end
