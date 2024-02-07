class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user = current_user
    if @reminder.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(:alarm_time)
  end
end
