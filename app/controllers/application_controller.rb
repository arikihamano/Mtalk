class ApplicationController < ActionController::Base

  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name self_introduction sex img_name))
  end

end
