class TasksController < ApplicationController
  def index
    @tasks_today = Task.where("next_date = ?", Date.today)
    @tasks_upcoming = Task.where("next_date > ?", Date.today).order(next_date: :asc)
  end
end
