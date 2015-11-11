class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        << [:last_name, :first_name, :phone_number, :end_date]
    devise_parameter_sanitizer.for(:account_update) << [:last_name, :first_name, :phone_number, :end_date]
  end
end
