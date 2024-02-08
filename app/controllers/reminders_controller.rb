class RemindersController < ApplicationController
  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.update(reminder_params)
    if @reminder.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(:alarm_time)
  end
end
