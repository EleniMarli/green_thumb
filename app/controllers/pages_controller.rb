class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :notify_user, only: [:dashboard]

  def home
    redirect_to :dashboard unless current_user.nil?
  end

  def dashboard
    @plants = Plant.where(user: current_user)
                    .order(nickname: :asc, scientific_name: :asc)
    @query = false
    if params[:query].present?
      @plants = @plants.search_by_name_and_room(params[:query])
      @query = true
    end
  end

  def helper
    if params[:user_question].present?
      user_question = "#{params[:user_question]} Answer in markdown format. Limit the answer to 400 characters."
      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "user", content: user_question }
        ]
      })
      @content = chaptgpt_response["choices"][0]["message"]["content"]
    end
  end

  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @tasks =  Task.joins(:plant)
                  .where(plants: { user_id: current_user.id })
                  .where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
                  .order(done: :asc)
                  .order(delayed: :desc)
  end

  private

  def notify_user
    tasks = Task.joins(:plant)
                .where(plants: { user_id: current_user.id })
                .where('start_time = ? AND shown = ? AND done = ?', Date.today, false, false)
    unless tasks.empty?
      flash.now[:notification] = "Hi, today you have #{tasks.count} new task(s)! 🔔"
      tasks.update_all(shown: true)
    end
  end
end
