class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Overriding Default after sign in path for user
  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :image, :first_name, :last_name) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :image, :first_name, :last_name) }
  end

end
