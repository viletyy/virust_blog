class Admin::BaseController < ApplicationController
  layout "admin/application"
  before_action :authenticate_user!
  before_action :check_user_role

  include Pundit
  protect_from_forgery

  private
  def check_user_role
    if current_user.admin_role == true
    else
      sign_out
      flash[:error] = "禁止登入"
      redirect_to new_user_session_path
    end
  end
end
