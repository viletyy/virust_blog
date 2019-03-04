# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "admin/login_application"
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  private

  def user_params
    params.require(:user).permit(:signin,:password,:remember_me)
  end
end
