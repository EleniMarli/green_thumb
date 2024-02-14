class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :notification
  before_action :set_start_of_week

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def set_start_of_week
    Date.beginning_of_week = :monday
  end
end
