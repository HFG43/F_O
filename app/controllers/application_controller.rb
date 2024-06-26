class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_paramas|
      user_paramas.permit(:name, :email, :birthday, :profile_image, :family_name, :family_token, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :birthday, :profile_image, :family_name, :family_token, :password, :password_confirmation, :current_password])
    
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:name, :email, :password)
    end  
  end
end
