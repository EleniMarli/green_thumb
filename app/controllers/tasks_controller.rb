class TasksController < ApplicationController
  def index
    user_tasks = current_user.plants.includes(:tasks).flat_map(&:tasks)
    @tasks_today = nil
    unless user_tasks.empty?
      @tasks_today = Task.joins(:plant)
                          .where(plants: { user_id: current_user.id })
                          .where(start_time: Date.today)
                          .order(done: :asc, delayed: :desc)
                          .order("plants.nickname ASC")
                          .order("plants.scientific_name ASC")
    end
  end





  def mark_done
    current_task_id = params[:id]
    @task = Task.find(current_task_id)
    @task.update(done: true)


    last_task = Task.where(task_type: @task.task_type, plant: @task.plant).order(start_time: :desc).first
    Task.create(
      task_type: last_task.task_type,
      start_time: last_task.start_time + last_task.frequency_in_days,
      frequency_in_days: last_task.frequency_in_days,
      done: false,
      shown: false,
      delayed: false,
      plant: @task.plant
    )

    redirect_to request.referer || root_path
  end
end
