class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :password,:first_name, :last_name,:preferred_name,:nationality, :gender, :date_of_birth,:bio,:contact_number])
      devise_parameter_sanitizer.permit(:account_update, keys:[:email, :password, :current_password, :first_name, :last_name,:preferred_name,:nationality, :gender,:date_of_birth,:bio,:contact_number])
  end
end
