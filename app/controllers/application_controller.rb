class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  def after_sign_in_path_for(resource)
    shops_path(resource)
  end
  def after_sign_out_path_for(resource_or_scope)
    request.referer
  end
end
