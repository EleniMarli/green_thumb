class TasksController < ApplicationController
  def index
    @incomplete_tasks_today = Task.where("date = ? AND done = ?", Date.today, false)
    # @tasks_upcoming = Task.where(date: (Date.today + 1)..(Date.today + 7)).order(date: :asc)
  end

  def mark_done
    current_task_id = params[:id]
    @task = Task.find(current_task_id)
    @task.update(done: true)
    last_task = Task.where(task_type: @task.task_type, plant: @task.plant).order(date: :desc).first
    Task.create(
      task_type: last_task.task_type,
      date: last_task.date + last_task.frequency_in_days,
      frequency_in_days: last_task.frequency_in_days,
      done: false,
      shown: false,
      delayed: false,
      plant: @task.plant
    )
    redirect_to tasks_path
  end
end
