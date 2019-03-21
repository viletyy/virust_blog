class ApplicationController < ActionController::Base

  before_action :configure_permitted_parametersod_name, if: :devise_controller?
  before_action :find_current_user

  def real_ip(request)
    request.env['HTTP_X_FORWARDED_FOR'].present? ? request.env['HTTP_X_FORWARDED_FOR'] : request.remote_ip
  end

  def configure_permitted_parametersod_name
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:signin, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_up) {|u|
      u.permit(:email, :username,:mobile, :password, :password_confirmation)}
  end

  def find_current_user
    if current_user.present?
      @current_user = current_user
    else
      @current_user = nil
    end
  end
end
