class UpdateJob < ApplicationJob
  queue_as :default

  def perform
    incomplete_tasks_yesterday = Task.where(start_time: Date.yesterday, done: false)
    incomplete_tasks_yesterday.each do |task|
      task.update(delayed: true, start_time: Date.today, shown: false)
      connected_tasks = Task.where(task_type: task.task_type, plant: task.plant, done: false).where.not(id: task.id)
      connected_tasks.each do |con_task|
        old_date = con_task.date
        con_task.update(start_time: (old_date + 1))
      end
    end
  end
end
