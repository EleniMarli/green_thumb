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
    if params[:user_question].present?
      user_question = "#{params[:user_question]} Answer in markdown format."
      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "user", content: user_question }
        ]
      })

      @content = chaptgpt_response["choices"][0]["message"]["content"]
    else
      @content = "Please provide a valid question."
    end
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
