class ApplicationController < ActionController::Base
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :username, :email, :password, :password_confirmation)
    end
  end
end
