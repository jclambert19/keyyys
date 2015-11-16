class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if params[:controller] == "devise/registrations" && params[:action] == "create" # it means it's a sign up
      stored_location_for(resource) || user_path(resource)
    elsif params[:controller] == "devise/sessions" && params[:action] == "create"# it means we are logging-in
      stored_location_for(resource) || bunches_path
    else
      stored_location_for(resource) || root_path
    end

  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        << [:last_name, :first_name, :phone_number, :end_date]
    devise_parameter_sanitizer.for(:account_update) << [:last_name, :first_name, :phone_number, :end_date]
  end
end
