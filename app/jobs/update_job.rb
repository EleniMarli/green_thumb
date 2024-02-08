class UpdateJob < ApplicationJob
  queue_as :default

  def perform
    tasks_today = Task.where(date: Date.today)
    tasks_
  end
end
