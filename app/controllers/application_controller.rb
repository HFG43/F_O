class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :birthday, :profile_image, :family_name, :family_token, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :birthday, :profile_image, :family_name, :family_token, :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:name, :email, :password)
    end  
  end
end
