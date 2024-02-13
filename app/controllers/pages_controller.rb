class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :notify_user, only: [:dashboard]

  def home
    redirect_to :dashboard unless current_user.nil?
  end

  def dashboard
    @plants = Plant.where(user: current_user)
    if params[:query].present?
      @plants = Plant.search_by_name_and_room(params[:query])
    end
  end

  def helper
  end

  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @tasks =  Task.joins(:plant)
                  .where(plants: { user_id: current_user.id })
                  .where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
                  .order(delayed: :desc)
                  .order(done: :asc)
  end

  private

  def notify_user
    tasks = Task.where('start_time = ? AND shown = ? AND done = ?', Date.today, false, false)
    unless tasks.empty?
      flash.now[:notification] = "Hi #{current_user.name}, today you have #{tasks.count} pending task(s)! 🔔"
      tasks.update_all(shown: true)
    end
  end
end
