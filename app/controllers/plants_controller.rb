class PlantsController < ApplicationController
  def show
    @plant = Plant.find(params[:id])
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to user_path(current_user)
  end
end
