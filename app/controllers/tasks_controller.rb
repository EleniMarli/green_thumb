class TasksController < ApplicationController
  def index
    @incomplete_tasks_today = Task.where("date = ? AND done = ?", Date.today, false)
    # @tasks_upcoming = Task.where(date: (Date.today + 1)..(Date.today + 7)).order(date: :asc)
  end

  def mark_done
    @task = Task.find(params[:id])
    @task.update(done: true)
    redirect_to tasks_path
  end
end
